#include "ruby.h"

#include "function.h"

VALUE rtest_class = Qnil;

void Init_rtest(void);

VALUE rtest_new(int argc, VALUE *argv, VALUE class);
static void rtest_free(void *p);
static VALUE rtest_init(int argc, VALUE *argv, VALUE self);
static VALUE rtest_add(VALUE self, VALUE other);
static VALUE rtest_sub(VALUE self, VALUE other);
static VALUE rtest_mul(VALUE self, VALUE other);
static VALUE rtest_div(VALUE self, VALUE other);
static VALUE rtest_inv(VALUE self);
static VALUE rtest_sim(VALUE self);

static VALUE rtest_get_s(VALUE self);
static VALUE rtest_get_num(VALUE self);
static VALUE rtest_get_den(VALUE self);
static VALUE rtest_get_f(VALUE self);
static VALUE rtest_set_s(VALUE self, VALUE other);
static VALUE rtest_set_num(VALUE self, VALUE other);
static VALUE rtest_set_den(VALUE self, VALUE other);

static VALUE rtest_cmp(VALUE self, VALUE other);

static VALUE rtest_to_float(VALUE self);

static VALUE rtest_to_s(VALUE self);

void Init_rtest(void) {
    rtest_class = rb_define_class("RTest", rb_cObject);
    rb_define_singleton_method(rtest_class, "new", rtest_new, -1);
    rb_define_method(rtest_class, "initialize", rtest_init, -1);

    rb_define_method(rtest_class, "<=>", rtest_cmp, 1);
    rb_include_module(rtest_class, rb_mComparable);

    /* getters && setters */
    rb_define_method(rtest_class, "sign", rtest_get_s, 0);
    rb_define_method(rtest_class, "sign=", rtest_set_s, 1);

    rb_define_method(rtest_class, "denominator", rtest_get_den, 0);
    rb_define_method(rtest_class, "denominator=", rtest_set_den, 1);

    rb_define_method(rtest_class, "numerator", rtest_get_num, 0);
    rb_define_method(rtest_class, "numerator=", rtest_set_num, 1);

    rb_define_method(rtest_class, "flag?", rtest_get_f, 0);

    /* operations */
    rb_define_method(rtest_class, "+", rtest_add, 1);
    rb_define_method(rtest_class, "-", rtest_sub, 1);
    rb_define_method(rtest_class, "*", rtest_mul, 1);
    rb_define_method(rtest_class, "/", rtest_div, 1);
    rb_define_method(rtest_class, "inv", rtest_inv, 0);
    rb_define_method(rtest_class, "sim", rtest_sim, 0);

    /* conversions */
    rb_define_method(rtest_class, "to_f", rtest_to_float, 0);

    /* printing */
    rb_define_method(rtest_class, "to_s", rtest_to_s, 0);
}

VALUE rtest_new(int argc, VALUE *argv, VALUE class) {
    VALUE result;
    uint64_t *val;

    result = Data_Make_Struct(class, uint64_t, NULL, rtest_free, val);
    rb_obj_call_init(result, argc, argv);

    return result;
}

static void rtest_free(void *p) {
    free(p);
}

static VALUE rtest_init(int argc, VALUE *argv, VALUE self) {
    uint64_t *val;

    Data_Get_Struct(self, uint64_t, val);

    if (argc == 3 && FIXNUM_P(argv[0])
            && FIXNUM_P(argv[1]) && FIXNUM_P(argv[2])) {

        *val = rational_new((FIX2INT(argv[0]) == 0)? POSITIVE: NEGATIVE,
                (unsigned)FIX2INT(argv[1]),
                (unsigned)FIX2INT(argv[2]));
    } else if (argc == 1 && (TYPE(*argv) == T_FLOAT || FIXNUM_P(*argv))) {
        *val = double_to_rational(NUM2DBL(*argv));
    } else {
        rb_raise(rb_eTypeError, "not valid value");
    }

    return self;
}

static VALUE rtest_add(VALUE self, VALUE other) {
    VALUE result = Qnil;
    uint64_t *new, *s_val, *o_val;

    if (RTEST(rb_funcall(other, rb_intern("is_a?"), 1, rtest_class))) {
        Data_Get_Struct(self, uint64_t, s_val);
        Data_Get_Struct(other, uint64_t, o_val);

        result = Data_Make_Struct(rtest_class, uint64_t, NULL, rtest_free, new);

        *new = rational_add(*s_val, *o_val);
    } else {
        rb_raise(rb_eTypeError, "not valid value");
    }

    return result;
}

static VALUE rtest_sub(VALUE self, VALUE other) {
    VALUE result = Qnil;
    uint64_t *new, *s_val, *o_val;

    if (RTEST(rb_funcall(other, rb_intern("is_a?"), 1, rtest_class))) {
        Data_Get_Struct(self, uint64_t, s_val);
        Data_Get_Struct(other, uint64_t, o_val);

        result = Data_Make_Struct(rtest_class, uint64_t, NULL, rtest_free, new);

        *new = rational_sub(*s_val, *o_val);
    } else {
        rb_raise(rb_eTypeError, "not valid value");
    }

    return result;
}

static VALUE rtest_mul(VALUE self, VALUE other) {
    VALUE result = Qnil;
    uint64_t *new, *s_val, *o_val;

    if (RTEST(rb_funcall(other, rb_intern("is_a?"), 1, rtest_class))) {
        Data_Get_Struct(self, uint64_t, s_val);
        Data_Get_Struct(other, uint64_t, o_val);

        result = Data_Make_Struct(rtest_class, uint64_t, NULL, rtest_free, new);

        *new = rational_mul(*s_val, *o_val);
    } else {
        rb_raise(rb_eTypeError, "not valid value");
    }

    return result;
}

static VALUE rtest_div(VALUE self, VALUE other) {
    VALUE result = Qnil;
    uint64_t *new, *s_val, *o_val;

    if (RTEST(rb_funcall(other, rb_intern("is_a?"), 1, rtest_class))) {
        Data_Get_Struct(self, uint64_t, s_val);
        Data_Get_Struct(other, uint64_t, o_val);

        result = Data_Make_Struct(rtest_class, uint64_t, NULL, rtest_free, new);

        *new = rational_div(*s_val, *o_val);
    } else {
        rb_raise(rb_eTypeError, "not valid value");
    }

    return result;
}

static VALUE rtest_inv(VALUE self) {
    uint64_t *val;

    Data_Get_Struct(self, uint64_t, val);
    *val = rational_inv(*val);

    return self;
}

static VALUE rtest_sim(VALUE self) {
    uint64_t *val;

    Data_Get_Struct(self, uint64_t, val);
    *val = rational_sim(*val);

    return self;
}

static VALUE rtest_get_s(VALUE self) {
    uint64_t *val;
    sign_t sign;

    Data_Get_Struct(self, uint64_t, val);
    sign = rational_get_sign(*val);
    return INT2FIX((sign == POSITIVE? 0: 1));
}

static VALUE rtest_get_num(VALUE self) {
    uint64_t *val;
    uint32_t result;

    Data_Get_Struct(self, uint64_t, val);
    result = rational_get_numerator(*val);
    return INT2FIX(result);
}

static VALUE rtest_get_den(VALUE self) {
    uint64_t *val;
    uint32_t result;

    Data_Get_Struct(self, uint64_t, val);
    result = rational_get_denominator(*val);
    return INT2FIX(result);
}

static VALUE rtest_get_f(VALUE self) {
    uint64_t *val;
    sign_t sign;

    Data_Get_Struct(self, uint64_t, val);
    sign = rational_get_sign(*val);
    return INT2FIX((sign == POSITIVE? 0: 1));
}

static VALUE rtest_set_s(VALUE self, VALUE other) {
    uint64_t *val;
    uint32_t set;

    if (FIXNUM_P(other)) {
        set = (uint32_t)FIX2INT(other);
        Data_Get_Struct(self, uint64_t, val);

        rational_set_sign(*val, (set == 0)? POSITIVE: NEGATIVE);
    } else {
        rb_raise(rb_eTypeError, "not valid value");
    }

    return self;
}

static VALUE rtest_set_num(VALUE self, VALUE other) {
    uint64_t *val;
    uint32_t set;

    if (FIXNUM_P(other)) {
        set = (uint32_t)FIX2INT(other);
        Data_Get_Struct(self, uint64_t, val);

        rational_set_numerator(*val, set);
    } else {
        rb_raise(rb_eTypeError, "not valid value");
    }

    return self;
}

static VALUE rtest_set_den(VALUE self, VALUE other) {
    uint64_t *val;
    uint32_t set;

    if (FIXNUM_P(other)) {
        set = (uint32_t)FIX2INT(other);
        Data_Get_Struct(self, uint64_t, val);

        rational_set_denominator(*val, set);
    } else {
        rb_raise(rb_eTypeError, "not valid value");
    }

    return self;
}

static VALUE rtest_cmp(VALUE self, VALUE other) {
    uint64_t *a, *b, alt_b;
    int result = 0;

    if (RTEST(rb_funcall(other, rb_intern("is_a?"), 1, rtest_class))) {
        Data_Get_Struct(self, uint64_t, a);
        Data_Get_Struct(other, uint64_t, b);

        result = rational_compare(*a, *b);
    } else if (FIXNUM_P(other)) {
        alt_b = double_to_rational(NUM2DBL(other));
        result = rational_compare(*a, alt_b);
    } else {
        rb_raise(rb_eTypeError, "not valid value");
    }

    return INT2FIX(result);
}

static VALUE rtest_to_float(VALUE self) {
    uint64_t *val;
    Data_Get_Struct(self, uint64_t, val);
    return rb_float_new(rational_to_double(*val));
}

static VALUE rtest_to_s(VALUE self) {
    VALUE result;
    uint64_t *val;
    char *cstr;
    Data_Get_Struct(self, uint64_t, val);

    cstr = rational_print(*val);
    result = rb_str_new2(cstr);
    free(cstr);

    return result;
}

