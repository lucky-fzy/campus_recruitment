package com.ldu.bs.bean;

import java.util.ArrayList;
import java.util.List;

public class ToudiExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ToudiExample() {
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

        public Criteria andToudiIdIsNull() {
            addCriterion("toudi_id is null");
            return (Criteria) this;
        }

        public Criteria andToudiIdIsNotNull() {
            addCriterion("toudi_id is not null");
            return (Criteria) this;
        }

        public Criteria andToudiIdEqualTo(Integer value) {
            addCriterion("toudi_id =", value, "toudiId");
            return (Criteria) this;
        }

        public Criteria andToudiIdNotEqualTo(Integer value) {
            addCriterion("toudi_id <>", value, "toudiId");
            return (Criteria) this;
        }

        public Criteria andToudiIdGreaterThan(Integer value) {
            addCriterion("toudi_id >", value, "toudiId");
            return (Criteria) this;
        }

        public Criteria andToudiIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("toudi_id >=", value, "toudiId");
            return (Criteria) this;
        }

        public Criteria andToudiIdLessThan(Integer value) {
            addCriterion("toudi_id <", value, "toudiId");
            return (Criteria) this;
        }

        public Criteria andToudiIdLessThanOrEqualTo(Integer value) {
            addCriterion("toudi_id <=", value, "toudiId");
            return (Criteria) this;
        }

        public Criteria andToudiIdIn(List<Integer> values) {
            addCriterion("toudi_id in", values, "toudiId");
            return (Criteria) this;
        }

        public Criteria andToudiIdNotIn(List<Integer> values) {
            addCriterion("toudi_id not in", values, "toudiId");
            return (Criteria) this;
        }

        public Criteria andToudiIdBetween(Integer value1, Integer value2) {
            addCriterion("toudi_id between", value1, value2, "toudiId");
            return (Criteria) this;
        }

        public Criteria andToudiIdNotBetween(Integer value1, Integer value2) {
            addCriterion("toudi_id not between", value1, value2, "toudiId");
            return (Criteria) this;
        }

        public Criteria andPositionIdIsNull() {
            addCriterion("position_id is null");
            return (Criteria) this;
        }

        public Criteria andPositionIdIsNotNull() {
            addCriterion("position_id is not null");
            return (Criteria) this;
        }

        public Criteria andPositionIdEqualTo(Integer value) {
            addCriterion("position_id =", value, "positionId");
            return (Criteria) this;
        }

        public Criteria andPositionIdNotEqualTo(Integer value) {
            addCriterion("position_id <>", value, "positionId");
            return (Criteria) this;
        }

        public Criteria andPositionIdGreaterThan(Integer value) {
            addCriterion("position_id >", value, "positionId");
            return (Criteria) this;
        }

        public Criteria andPositionIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("position_id >=", value, "positionId");
            return (Criteria) this;
        }

        public Criteria andPositionIdLessThan(Integer value) {
            addCriterion("position_id <", value, "positionId");
            return (Criteria) this;
        }

        public Criteria andPositionIdLessThanOrEqualTo(Integer value) {
            addCriterion("position_id <=", value, "positionId");
            return (Criteria) this;
        }

        public Criteria andPositionIdIn(List<Integer> values) {
            addCriterion("position_id in", values, "positionId");
            return (Criteria) this;
        }

        public Criteria andPositionIdNotIn(List<Integer> values) {
            addCriterion("position_id not in", values, "positionId");
            return (Criteria) this;
        }

        public Criteria andPositionIdBetween(Integer value1, Integer value2) {
            addCriterion("position_id between", value1, value2, "positionId");
            return (Criteria) this;
        }

        public Criteria andPositionIdNotBetween(Integer value1, Integer value2) {
            addCriterion("position_id not between", value1, value2, "positionId");
            return (Criteria) this;
        }

        public Criteria andResumeIdIsNull() {
            addCriterion("resume_id is null");
            return (Criteria) this;
        }

        public Criteria andResumeIdIsNotNull() {
            addCriterion("resume_id is not null");
            return (Criteria) this;
        }

        public Criteria andResumeIdEqualTo(Integer value) {
            addCriterion("resume_id =", value, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdNotEqualTo(Integer value) {
            addCriterion("resume_id <>", value, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdGreaterThan(Integer value) {
            addCriterion("resume_id >", value, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("resume_id >=", value, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdLessThan(Integer value) {
            addCriterion("resume_id <", value, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdLessThanOrEqualTo(Integer value) {
            addCriterion("resume_id <=", value, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdIn(List<Integer> values) {
            addCriterion("resume_id in", values, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdNotIn(List<Integer> values) {
            addCriterion("resume_id not in", values, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdBetween(Integer value1, Integer value2) {
            addCriterion("resume_id between", value1, value2, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdNotBetween(Integer value1, Integer value2) {
            addCriterion("resume_id not between", value1, value2, "resumeId");
            return (Criteria) this;
        }

        public Criteria andToudiDateIsNull() {
            addCriterion("toudi_date is null");
            return (Criteria) this;
        }

        public Criteria andToudiDateIsNotNull() {
            addCriterion("toudi_date is not null");
            return (Criteria) this;
        }

        public Criteria andToudiDateEqualTo(String value) {
            addCriterion("toudi_date =", value, "toudiDate");
            return (Criteria) this;
        }

        public Criteria andToudiDateNotEqualTo(String value) {
            addCriterion("toudi_date <>", value, "toudiDate");
            return (Criteria) this;
        }

        public Criteria andToudiDateGreaterThan(String value) {
            addCriterion("toudi_date >", value, "toudiDate");
            return (Criteria) this;
        }

        public Criteria andToudiDateGreaterThanOrEqualTo(String value) {
            addCriterion("toudi_date >=", value, "toudiDate");
            return (Criteria) this;
        }

        public Criteria andToudiDateLessThan(String value) {
            addCriterion("toudi_date <", value, "toudiDate");
            return (Criteria) this;
        }

        public Criteria andToudiDateLessThanOrEqualTo(String value) {
            addCriterion("toudi_date <=", value, "toudiDate");
            return (Criteria) this;
        }

        public Criteria andToudiDateLike(String value) {
            addCriterion("toudi_date like", value, "toudiDate");
            return (Criteria) this;
        }

        public Criteria andToudiDateNotLike(String value) {
            addCriterion("toudi_date not like", value, "toudiDate");
            return (Criteria) this;
        }

        public Criteria andToudiDateIn(List<String> values) {
            addCriterion("toudi_date in", values, "toudiDate");
            return (Criteria) this;
        }

        public Criteria andToudiDateNotIn(List<String> values) {
            addCriterion("toudi_date not in", values, "toudiDate");
            return (Criteria) this;
        }

        public Criteria andToudiDateBetween(String value1, String value2) {
            addCriterion("toudi_date between", value1, value2, "toudiDate");
            return (Criteria) this;
        }

        public Criteria andToudiDateNotBetween(String value1, String value2) {
            addCriterion("toudi_date not between", value1, value2, "toudiDate");
            return (Criteria) this;
        }

        public Criteria andToudiTypeIsNull() {
            addCriterion("toudi_type is null");
            return (Criteria) this;
        }

        public Criteria andToudiTypeIsNotNull() {
            addCriterion("toudi_type is not null");
            return (Criteria) this;
        }

        public Criteria andToudiTypeEqualTo(Integer value) {
            addCriterion("toudi_type =", value, "toudiType");
            return (Criteria) this;
        }

        public Criteria andToudiTypeNotEqualTo(Integer value) {
            addCriterion("toudi_type <>", value, "toudiType");
            return (Criteria) this;
        }

        public Criteria andToudiTypeGreaterThan(Integer value) {
            addCriterion("toudi_type >", value, "toudiType");
            return (Criteria) this;
        }

        public Criteria andToudiTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("toudi_type >=", value, "toudiType");
            return (Criteria) this;
        }

        public Criteria andToudiTypeLessThan(Integer value) {
            addCriterion("toudi_type <", value, "toudiType");
            return (Criteria) this;
        }

        public Criteria andToudiTypeLessThanOrEqualTo(Integer value) {
            addCriterion("toudi_type <=", value, "toudiType");
            return (Criteria) this;
        }

        public Criteria andToudiTypeIn(List<Integer> values) {
            addCriterion("toudi_type in", values, "toudiType");
            return (Criteria) this;
        }

        public Criteria andToudiTypeNotIn(List<Integer> values) {
            addCriterion("toudi_type not in", values, "toudiType");
            return (Criteria) this;
        }

        public Criteria andToudiTypeBetween(Integer value1, Integer value2) {
            addCriterion("toudi_type between", value1, value2, "toudiType");
            return (Criteria) this;
        }

        public Criteria andToudiTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("toudi_type not between", value1, value2, "toudiType");
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