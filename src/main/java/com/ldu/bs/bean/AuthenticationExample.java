package com.ldu.bs.bean;

import java.util.ArrayList;
import java.util.List;

public class AuthenticationExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AuthenticationExample() {
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

        public Criteria andAuthenticationIdIsNull() {
            addCriterion("authentication_id is null");
            return (Criteria) this;
        }

        public Criteria andAuthenticationIdIsNotNull() {
            addCriterion("authentication_id is not null");
            return (Criteria) this;
        }

        public Criteria andAuthenticationIdEqualTo(Integer value) {
            addCriterion("authentication_id =", value, "authenticationId");
            return (Criteria) this;
        }

        public Criteria andAuthenticationIdNotEqualTo(Integer value) {
            addCriterion("authentication_id <>", value, "authenticationId");
            return (Criteria) this;
        }

        public Criteria andAuthenticationIdGreaterThan(Integer value) {
            addCriterion("authentication_id >", value, "authenticationId");
            return (Criteria) this;
        }

        public Criteria andAuthenticationIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("authentication_id >=", value, "authenticationId");
            return (Criteria) this;
        }

        public Criteria andAuthenticationIdLessThan(Integer value) {
            addCriterion("authentication_id <", value, "authenticationId");
            return (Criteria) this;
        }

        public Criteria andAuthenticationIdLessThanOrEqualTo(Integer value) {
            addCriterion("authentication_id <=", value, "authenticationId");
            return (Criteria) this;
        }

        public Criteria andAuthenticationIdIn(List<Integer> values) {
            addCriterion("authentication_id in", values, "authenticationId");
            return (Criteria) this;
        }

        public Criteria andAuthenticationIdNotIn(List<Integer> values) {
            addCriterion("authentication_id not in", values, "authenticationId");
            return (Criteria) this;
        }

        public Criteria andAuthenticationIdBetween(Integer value1, Integer value2) {
            addCriterion("authentication_id between", value1, value2, "authenticationId");
            return (Criteria) this;
        }

        public Criteria andAuthenticationIdNotBetween(Integer value1, Integer value2) {
            addCriterion("authentication_id not between", value1, value2, "authenticationId");
            return (Criteria) this;
        }

        public Criteria andCompanyIdIsNull() {
            addCriterion("company_id is null");
            return (Criteria) this;
        }

        public Criteria andCompanyIdIsNotNull() {
            addCriterion("company_id is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyIdEqualTo(Integer value) {
            addCriterion("company_id =", value, "companyId");
            return (Criteria) this;
        }

        public Criteria andCompanyIdNotEqualTo(Integer value) {
            addCriterion("company_id <>", value, "companyId");
            return (Criteria) this;
        }

        public Criteria andCompanyIdGreaterThan(Integer value) {
            addCriterion("company_id >", value, "companyId");
            return (Criteria) this;
        }

        public Criteria andCompanyIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("company_id >=", value, "companyId");
            return (Criteria) this;
        }

        public Criteria andCompanyIdLessThan(Integer value) {
            addCriterion("company_id <", value, "companyId");
            return (Criteria) this;
        }

        public Criteria andCompanyIdLessThanOrEqualTo(Integer value) {
            addCriterion("company_id <=", value, "companyId");
            return (Criteria) this;
        }

        public Criteria andCompanyIdIn(List<Integer> values) {
            addCriterion("company_id in", values, "companyId");
            return (Criteria) this;
        }

        public Criteria andCompanyIdNotIn(List<Integer> values) {
            addCriterion("company_id not in", values, "companyId");
            return (Criteria) this;
        }

        public Criteria andCompanyIdBetween(Integer value1, Integer value2) {
            addCriterion("company_id between", value1, value2, "companyId");
            return (Criteria) this;
        }

        public Criteria andCompanyIdNotBetween(Integer value1, Integer value2) {
            addCriterion("company_id not between", value1, value2, "companyId");
            return (Criteria) this;
        }

        public Criteria andLicenseIsNull() {
            addCriterion("license is null");
            return (Criteria) this;
        }

        public Criteria andLicenseIsNotNull() {
            addCriterion("license is not null");
            return (Criteria) this;
        }

        public Criteria andLicenseEqualTo(String value) {
            addCriterion("license =", value, "license");
            return (Criteria) this;
        }

        public Criteria andLicenseNotEqualTo(String value) {
            addCriterion("license <>", value, "license");
            return (Criteria) this;
        }

        public Criteria andLicenseGreaterThan(String value) {
            addCriterion("license >", value, "license");
            return (Criteria) this;
        }

        public Criteria andLicenseGreaterThanOrEqualTo(String value) {
            addCriterion("license >=", value, "license");
            return (Criteria) this;
        }

        public Criteria andLicenseLessThan(String value) {
            addCriterion("license <", value, "license");
            return (Criteria) this;
        }

        public Criteria andLicenseLessThanOrEqualTo(String value) {
            addCriterion("license <=", value, "license");
            return (Criteria) this;
        }

        public Criteria andLicenseLike(String value) {
            addCriterion("license like", value, "license");
            return (Criteria) this;
        }

        public Criteria andLicenseNotLike(String value) {
            addCriterion("license not like", value, "license");
            return (Criteria) this;
        }

        public Criteria andLicenseIn(List<String> values) {
            addCriterion("license in", values, "license");
            return (Criteria) this;
        }

        public Criteria andLicenseNotIn(List<String> values) {
            addCriterion("license not in", values, "license");
            return (Criteria) this;
        }

        public Criteria andLicenseBetween(String value1, String value2) {
            addCriterion("license between", value1, value2, "license");
            return (Criteria) this;
        }

        public Criteria andLicenseNotBetween(String value1, String value2) {
            addCriterion("license not between", value1, value2, "license");
            return (Criteria) this;
        }

        public Criteria andAuthDateIsNull() {
            addCriterion("auth_date is null");
            return (Criteria) this;
        }

        public Criteria andAuthDateIsNotNull() {
            addCriterion("auth_date is not null");
            return (Criteria) this;
        }

        public Criteria andAuthDateEqualTo(String value) {
            addCriterion("auth_date =", value, "authDate");
            return (Criteria) this;
        }

        public Criteria andAuthDateNotEqualTo(String value) {
            addCriterion("auth_date <>", value, "authDate");
            return (Criteria) this;
        }

        public Criteria andAuthDateGreaterThan(String value) {
            addCriterion("auth_date >", value, "authDate");
            return (Criteria) this;
        }

        public Criteria andAuthDateGreaterThanOrEqualTo(String value) {
            addCriterion("auth_date >=", value, "authDate");
            return (Criteria) this;
        }

        public Criteria andAuthDateLessThan(String value) {
            addCriterion("auth_date <", value, "authDate");
            return (Criteria) this;
        }

        public Criteria andAuthDateLessThanOrEqualTo(String value) {
            addCriterion("auth_date <=", value, "authDate");
            return (Criteria) this;
        }

        public Criteria andAuthDateLike(String value) {
            addCriterion("auth_date like", value, "authDate");
            return (Criteria) this;
        }

        public Criteria andAuthDateNotLike(String value) {
            addCriterion("auth_date not like", value, "authDate");
            return (Criteria) this;
        }

        public Criteria andAuthDateIn(List<String> values) {
            addCriterion("auth_date in", values, "authDate");
            return (Criteria) this;
        }

        public Criteria andAuthDateNotIn(List<String> values) {
            addCriterion("auth_date not in", values, "authDate");
            return (Criteria) this;
        }

        public Criteria andAuthDateBetween(String value1, String value2) {
            addCriterion("auth_date between", value1, value2, "authDate");
            return (Criteria) this;
        }

        public Criteria andAuthDateNotBetween(String value1, String value2) {
            addCriterion("auth_date not between", value1, value2, "authDate");
            return (Criteria) this;
        }

        public Criteria andIsauthIsNull() {
            addCriterion("isAuth is null");
            return (Criteria) this;
        }

        public Criteria andIsauthIsNotNull() {
            addCriterion("isAuth is not null");
            return (Criteria) this;
        }

        public Criteria andIsauthEqualTo(String value) {
            addCriterion("isAuth =", value, "isauth");
            return (Criteria) this;
        }

        public Criteria andIsauthNotEqualTo(String value) {
            addCriterion("isAuth <>", value, "isauth");
            return (Criteria) this;
        }

        public Criteria andIsauthGreaterThan(String value) {
            addCriterion("isAuth >", value, "isauth");
            return (Criteria) this;
        }

        public Criteria andIsauthGreaterThanOrEqualTo(String value) {
            addCriterion("isAuth >=", value, "isauth");
            return (Criteria) this;
        }

        public Criteria andIsauthLessThan(String value) {
            addCriterion("isAuth <", value, "isauth");
            return (Criteria) this;
        }

        public Criteria andIsauthLessThanOrEqualTo(String value) {
            addCriterion("isAuth <=", value, "isauth");
            return (Criteria) this;
        }

        public Criteria andIsauthLike(String value) {
            addCriterion("isAuth like", value, "isauth");
            return (Criteria) this;
        }

        public Criteria andIsauthNotLike(String value) {
            addCriterion("isAuth not like", value, "isauth");
            return (Criteria) this;
        }

        public Criteria andIsauthIn(List<String> values) {
            addCriterion("isAuth in", values, "isauth");
            return (Criteria) this;
        }

        public Criteria andIsauthNotIn(List<String> values) {
            addCriterion("isAuth not in", values, "isauth");
            return (Criteria) this;
        }

        public Criteria andIsauthBetween(String value1, String value2) {
            addCriterion("isAuth between", value1, value2, "isauth");
            return (Criteria) this;
        }

        public Criteria andIsauthNotBetween(String value1, String value2) {
            addCriterion("isAuth not between", value1, value2, "isauth");
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