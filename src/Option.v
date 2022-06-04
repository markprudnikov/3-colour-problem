(** File generated by coq-of-ocaml *)
Require Import CoqOfOCaml.CoqOfOCaml.
Require Import CoqOfOCaml.Settings.

Definition t (a : Set) : Set := option a.

Definition none {A : Set} : t A := None.

Definition some {A : Set} (v_value : A) : t A := Some v_value.

Definition value_value {A : Set} (o_value : t A) (default : A) : A :=
  match o_value with
  | Some v_value => v_value
  | None => default
  end.

Definition bind {A B : Set} (o_value : t A) (f_value : A -> t B) : t B :=
  match o_value with
  | None => None
  | Some v_value => f_value v_value
  end.

Definition join {A : Set} (function_parameter : t (t A)) : t A :=
  match function_parameter with
  | Some o_value => o_value
  | None => None
  end.

Definition map {A B : Set} (f_value : A -> B) (o_value : t A) : t B :=
  match o_value with
  | None => None
  | Some v_value => Some (f_value v_value)
  end.

Definition fold {A B : Set}
  (none : A) (some : B -> A) (function_parameter : t B) : A :=
  match function_parameter with
  | Some v_value => some v_value
  | None => none
  end.

Definition iter {A : Set} (f_value : A -> unit) (function_parameter : t A)
  : unit :=
  match function_parameter with
  | Some v_value => f_value v_value
  | None => tt
  end.

Definition is_none {A : Set} (function_parameter : t A) : bool :=
  match function_parameter with
  | None => true
  | Some _ => false
  end.

Definition is_some {A : Set} (function_parameter : t A) : bool :=
  match function_parameter with
  | None => false
  | Some _ => true
  end.

Definition equal {A B : Set} (eq_value : A -> B -> bool) (o0 : t A) (o1 : t B)
  : bool :=
  match (o0, o1) with
  | (Some v0, Some v1) => eq_value v0 v1
  | (None, None) => true
  | _ => false
  end.

Definition compare {A B : Set} (cmp : A -> B -> int) (o0 : t A) (o1 : t B)
  : int :=
  match (o0, o1) with
  | (Some v0, Some v1) => cmp v0 v1
  | (None, None) => 0
  | (None, Some _) => (-1)
  | (Some _, None) => 1
  end.

Definition to_list {A : Set} (function_parameter : t A) : list A :=
  match function_parameter with
  | None => nil
  | Some v_value => [ v_value ]
  end.
