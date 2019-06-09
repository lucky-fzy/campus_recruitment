package com.ldu.bs.bean;

import java.util.ArrayList;
import java.util.List;

public class MidClassExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public MidClassExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andMidIdIsNull() {
            addCriterion("mid_id is null");
            return (Criteria) this;
        }

        public Criteria andMidIdIsNotNull() {
            addCriterion("mid_id is not null");
            return (Criteria) this;
        }

        public Criteria andMidIdEqualTo(Integer value) {
            addCriterion("mid_id =", value, "midId");
            return (Criteria) this;
        }

        public Criteria andMidIdNotEqualTo(Integer value) {
            addCriterion("mid_id <>", value, "midId");
            return (Criteria) this;
        }

        public Criteria andMidIdGreaterThan(Integer value) {
            addCriterion("mid_id >", value, "midId");
            return (Criteria) this;
        }

        public Criteria andMidIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("mid_id >=", value, "midId");
            return (Criteria) this;
        }

        public Criteria andMidIdLessThan(Integer value) {
            addCriterion("mid_id <", value, "midId");
            return (Criteria) this;
        }

        public Criteria andMidIdLessThanOrEqualTo(Integer value) {
            addCriterion("mid_id <=", value, "midId");
            return (Criteria) this;
        }

        public Criteria andMidIdIn(List<Integer> values) {
            addCriterion("mid_id in", values, "midId");
            return (Criteria) this;
        }

        public Criteria andMidIdNotIn(List<Integer> values) {
            addCriterion("mid_id not in", values, "midId");
            return (Criteria) this;
        }

        public Criteria andMidIdBetween(Integer value1, Integer value2) {
            addCriterion("mid_id between", value1, value2, "midId");
            return (Criteria) this;
        }

        public Criteria andMidIdNotBetween(Integer value1, Integer value2) {
            addCriterion("mid_id not between", value1, value2, "midId");
            return (Criteria) this;
        }

        public Criteria andMidNameIsNull() {
            addCriterion("mid_name is null");
            return (Criteria) this;
        }

        public Criteria andMidNameIsNotNull() {
            addCriterion("mid_name is not null");
            return (Criteria) this;
        }

        public Criteria andMidNameEqualTo(String value) {
            addCriterion("mid_name =", value, "midName");
            return (Criteria) this;
        }

        public Criteria andMidNameNotEqualTo(String value) {
            addCriterion("mid_name <>", value, "midName");
            return (Criteria) this;
        }

        public Criteria andMidNameGreaterThan(String value) {
            addCriterion("mid_name >", value, "midName");
            return (Criteria) this;
        }

        public Criteria andMidNameGreaterThanOrEqualTo(String value) {
            addCriterion("mid_name >=", value, "midName");
            return (Criteria) this;
        }

        public Criteria andMidNameLessThan(String value) {
            addCriterion("mid_name <", value, "midName");
            return (Criteria) this;
        }

        public Criteria andMidNameLessThanOrEqualTo(String value) {
            addCriterion("mid_name <=", value, "midName");
            return (Criteria) this;
        }

        public Criteria andMidNameLike(String value) {
            addCriterion("mid_name like", value, "midName");
            return (Criteria) this;
        }

        public Criteria andMidNameNotLike(String value) {
            addCriterion("mid_name not like", value, "midName");
            return (Criteria) this;
        }

        public Criteria andMidNameIn(List<String> values) {
            addCriterion("mid_name in", values, "midName");
            return (Criteria) this;
        }

        public Criteria andMidNameNotIn(List<String> values) {
            addCriterion("mid_name not in", values, "midName");
            return (Criteria) this;
        }

        public Criteria andMidNameBetween(String value1, String value2) {
            addCriterion("mid_name between", value1, value2, "midName");
            return (Criteria) this;
        }

        public Criteria andMidNameNotBetween(String value1, String value2) {
            addCriterion("mid_name not between", value1, value2, "midName");
            return (Criteria) this;
        }

        public Criteria andBigIdIsNull() {
            addCriterion("big_id is null");
            return (Criteria) this;
        }

        public Criteria andBigIdIsNotNull() {
            addCriterion("big_id is not null");
            return (Criteria) this;
        }

        public Criteria andBigIdEqualTo(Integer value) {
            addCriterion("big_id =", value, "bigId");
            return (Criteria) this;
        }

        public Criteria andBigIdNotEqualTo(Integer value) {
            addCriterion("big_id <>", value, "bigId");
            return (Criteria) this;
        }

        public Criteria andBigIdGreaterThan(Integer value) {
            addCriterion("big_id >", value, "bigId");
            return (Criteria) this;
        }

        public Criteria andBigIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("big_id >=", value, "bigId");
            return (Criteria) this;
        }

        public Criteria andBigIdLessThan(Integer value) {
            addCriterion("big_id <", value, "bigId");
            return (Criteria) this;
        }

        public Criteria andBigIdLessThanOrEqualTo(Integer value) {
            addCriterion("big_id <=", value, "bigId");
            return (Criteria) this;
        }

        public Criteria andBigIdIn(List<Integer> values) {
            addCriterion("big_id in", values, "bigId");
            return (Criteria) this;
        }

        public Criteria andBigIdNotIn(List<Integer> values) {
            addCriterion("big_id not in", values, "bigId");
            return (Criteria) this;
        }

        public Criteria andBigIdBetween(Integer value1, Integer value2) {
            addCriterion("big_id between", value1, value2, "bigId");
            return (Criteria) this;
        }

        public Criteria andBigIdNotBetween(Integer value1, Integer value2) {
            addCriterion("big_id not between", value1, value2, "bigId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}