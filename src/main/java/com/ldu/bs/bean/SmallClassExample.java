package com.ldu.bs.bean;

import java.util.ArrayList;
import java.util.List;

public class SmallClassExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SmallClassExample() {
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

        public Criteria andSmallIdIsNull() {
            addCriterion("small_id is null");
            return (Criteria) this;
        }

        public Criteria andSmallIdIsNotNull() {
            addCriterion("small_id is not null");
            return (Criteria) this;
        }

        public Criteria andSmallIdEqualTo(Integer value) {
            addCriterion("small_id =", value, "smallId");
            return (Criteria) this;
        }

        public Criteria andSmallIdNotEqualTo(Integer value) {
            addCriterion("small_id <>", value, "smallId");
            return (Criteria) this;
        }

        public Criteria andSmallIdGreaterThan(Integer value) {
            addCriterion("small_id >", value, "smallId");
            return (Criteria) this;
        }

        public Criteria andSmallIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("small_id >=", value, "smallId");
            return (Criteria) this;
        }

        public Criteria andSmallIdLessThan(Integer value) {
            addCriterion("small_id <", value, "smallId");
            return (Criteria) this;
        }

        public Criteria andSmallIdLessThanOrEqualTo(Integer value) {
            addCriterion("small_id <=", value, "smallId");
            return (Criteria) this;
        }

        public Criteria andSmallIdIn(List<Integer> values) {
            addCriterion("small_id in", values, "smallId");
            return (Criteria) this;
        }

        public Criteria andSmallIdNotIn(List<Integer> values) {
            addCriterion("small_id not in", values, "smallId");
            return (Criteria) this;
        }

        public Criteria andSmallIdBetween(Integer value1, Integer value2) {
            addCriterion("small_id between", value1, value2, "smallId");
            return (Criteria) this;
        }

        public Criteria andSmallIdNotBetween(Integer value1, Integer value2) {
            addCriterion("small_id not between", value1, value2, "smallId");
            return (Criteria) this;
        }

        public Criteria andSmallNameIsNull() {
            addCriterion("small_name is null");
            return (Criteria) this;
        }

        public Criteria andSmallNameIsNotNull() {
            addCriterion("small_name is not null");
            return (Criteria) this;
        }

        public Criteria andSmallNameEqualTo(String value) {
            addCriterion("small_name =", value, "smallName");
            return (Criteria) this;
        }

        public Criteria andSmallNameNotEqualTo(String value) {
            addCriterion("small_name <>", value, "smallName");
            return (Criteria) this;
        }

        public Criteria andSmallNameGreaterThan(String value) {
            addCriterion("small_name >", value, "smallName");
            return (Criteria) this;
        }

        public Criteria andSmallNameGreaterThanOrEqualTo(String value) {
            addCriterion("small_name >=", value, "smallName");
            return (Criteria) this;
        }

        public Criteria andSmallNameLessThan(String value) {
            addCriterion("small_name <", value, "smallName");
            return (Criteria) this;
        }

        public Criteria andSmallNameLessThanOrEqualTo(String value) {
            addCriterion("small_name <=", value, "smallName");
            return (Criteria) this;
        }

        public Criteria andSmallNameLike(String value) {
            addCriterion("small_name like", value, "smallName");
            return (Criteria) this;
        }

        public Criteria andSmallNameNotLike(String value) {
            addCriterion("small_name not like", value, "smallName");
            return (Criteria) this;
        }

        public Criteria andSmallNameIn(List<String> values) {
            addCriterion("small_name in", values, "smallName");
            return (Criteria) this;
        }

        public Criteria andSmallNameNotIn(List<String> values) {
            addCriterion("small_name not in", values, "smallName");
            return (Criteria) this;
        }

        public Criteria andSmallNameBetween(String value1, String value2) {
            addCriterion("small_name between", value1, value2, "smallName");
            return (Criteria) this;
        }

        public Criteria andSmallNameNotBetween(String value1, String value2) {
            addCriterion("small_name not between", value1, value2, "smallName");
            return (Criteria) this;
        }

        public Criteria andIshotIsNull() {
            addCriterion("ishot is null");
            return (Criteria) this;
        }

        public Criteria andIshotIsNotNull() {
            addCriterion("ishot is not null");
            return (Criteria) this;
        }

        public Criteria andIshotEqualTo(Integer value) {
            addCriterion("ishot =", value, "ishot");
            return (Criteria) this;
        }

        public Criteria andIshotNotEqualTo(Integer value) {
            addCriterion("ishot <>", value, "ishot");
            return (Criteria) this;
        }

        public Criteria andIshotGreaterThan(Integer value) {
            addCriterion("ishot >", value, "ishot");
            return (Criteria) this;
        }

        public Criteria andIshotGreaterThanOrEqualTo(Integer value) {
            addCriterion("ishot >=", value, "ishot");
            return (Criteria) this;
        }

        public Criteria andIshotLessThan(Integer value) {
            addCriterion("ishot <", value, "ishot");
            return (Criteria) this;
        }

        public Criteria andIshotLessThanOrEqualTo(Integer value) {
            addCriterion("ishot <=", value, "ishot");
            return (Criteria) this;
        }

        public Criteria andIshotIn(List<Integer> values) {
            addCriterion("ishot in", values, "ishot");
            return (Criteria) this;
        }

        public Criteria andIshotNotIn(List<Integer> values) {
            addCriterion("ishot not in", values, "ishot");
            return (Criteria) this;
        }

        public Criteria andIshotBetween(Integer value1, Integer value2) {
            addCriterion("ishot between", value1, value2, "ishot");
            return (Criteria) this;
        }

        public Criteria andIshotNotBetween(Integer value1, Integer value2) {
            addCriterion("ishot not between", value1, value2, "ishot");
            return (Criteria) this;
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