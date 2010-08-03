/*
 * MODELS
 */

#include <assert.h>
#include <inttypes.h>
#include <string.h>

#include "memalloc.h"
#include "models.h"


/*
 * Allocate an initialize a model
 * - terms = the attached term table
 * - map and vtbl are given default sizes
 * - alias_map is NULL
 */
model_t *new_model(term_table_t *terms, bool keep_subst) {
  model_t *model;

  model = (model_t *) safe_malloc(sizeof(model_t));
  init_value_table(&model->vtbl, 0, terms->types);
  init_int_hmap(&model->map, 0);
  model->alias_map = NULL;
  model->terms = terms;
  model->has_alias = keep_subst;

  return model;
}

/*
 * Delete a model
 */
void free_model(model_t *model) {
  delete_value_table(&model->vtbl);
  delete_int_hmap(&model->map);
  if (model->alias_map != NULL) {
    delete_int_hmap(model->alias_map);
    safe_free(model->alias_map);
  }
  safe_free(model);
}


/*
 * Find the value of term t in model
 * - return null_value if t is not mapped to anything
 * - return the concrete object mapped to t otherwise
 */
value_t model_find_term_value(model_t *model, term_t t) {
  int_hmap_pair_t *r;

  assert(good_term(model->terms, t));

  r = int_hmap_find(&model->map, t);
  if (r == NULL) {
    return null_value;
  } else {
    return r->val;
  }
}



/*
 * Check whether t is mapped to a term v in the substitution table.
 * - return v if it is
 * - return NULL_TERM otherwise
 */
term_t model_find_term_substitution(model_t *model, term_t t) {
  int_hmap_t *alias;
  int_hmap_pair_t *r;

  assert(good_term(model->terms, t) && model->has_alias);
  alias = model->alias_map;
  if (alias != NULL) {
    r = int_hmap_find(alias, t);
    if (r != NULL) {
      return r->val;
    }
  }

  return NULL_TERM;
}




/*
 * Store the mapping t := v in model
 * - t must not be mapped to anything
 * - v must be a valid object created in model->vtbl.
 *
 * If v is uninterpreted or a function object and it has no name,
 * then t's name is given to v.
 */
void model_map_term(model_t *model, term_t t, value_t v) {
  int_hmap_pair_t *r;
  value_table_t *vtbl;
  char *name;

  assert(good_term(model->terms, t));

  r = int_hmap_get(&model->map, t);
  assert(r->val < 0);
  r->val = v;

  // copy t's name if any
  name = term_name(model->terms, t);
  if (name != NULL) {
    vtbl = &model->vtbl;
    switch (object_kind(vtbl, v)) {
    case UNINTERPRETED_VALUE:
      if (vtbl_unint(vtbl, v)->name == NULL) {
	vtbl_set_constant_name(vtbl, v, name);
      }
      break;
    case FUNCTION_VALUE:
      if (vtbl_function(vtbl, v)->name == NULL) {
	vtbl_set_function_name(vtbl, v, name);
      }
      break;
    default:
      break;
    }
  }
}





/*
 * Store the substitution t --> u in the model
 * - t and u must be valid term indices
 * - t must be an uninterpreted term, not mapped to anything
 */
void model_add_substitution(model_t *model, term_t t, term_t u) {
  int_hmap_t *alias;
  int_hmap_pair_t *r;

  assert(term_kind(model->terms, t) == UNINTERPRETED_TERM &&
	 good_term(model->terms, u) && t != u && model->has_alias &&
	 int_hmap_find(&model->map, t) == NULL);

  alias = model->alias_map;
  if (alias == NULL) {
    alias = (int_hmap_t *) safe_malloc(sizeof(int_hmap_t));
    init_int_hmap(alias, 0); // default size
    model->alias_map = alias;
  }

  r = int_hmap_get(alias, t);
  assert(r->val < 0);
  r->val = u;
}







