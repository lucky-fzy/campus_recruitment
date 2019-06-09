package com.ldu.bs.bean;

import java.util.ArrayList;
import java.util.List;

public class CompanyExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CompanyExample() {
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

        public Criteria andCompanyNameIsNull() {
            addCriterion("company_name is null");
            return (Criteria) this;
        }

        public Criteria andCompanyNameIsNotNull() {
            addCriterion("company_name is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyNameEqualTo(String value) {
            addCriterion("company_name =", value, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameNotEqualTo(String value) {
            addCriterion("company_name <>", value, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameGreaterThan(String value) {
            addCriterion("company_name >", value, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameGreaterThanOrEqualTo(String value) {
            addCriterion("company_name >=", value, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameLessThan(String value) {
            addCriterion("company_name <", value, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameLessThanOrEqualTo(String value) {
            addCriterion("company_name <=", value, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameLike(String value) {
            addCriterion("company_name like", value, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameNotLike(String value) {
            addCriterion("company_name not like", value, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameIn(List<String> values) {
            addCriterion("company_name in", values, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameNotIn(List<String> values) {
            addCriterion("company_name not in", values, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameBetween(String value1, String value2) {
            addCriterion("company_name between", value1, value2, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameNotBetween(String value1, String value2) {
            addCriterion("company_name not between", value1, value2, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyPhoneIsNull() {
            addCriterion("company_phone is null");
            return (Criteria) this;
        }

        public Criteria andCompanyPhoneIsNotNull() {
            addCriterion("company_phone is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyPhoneEqualTo(String value) {
            addCriterion("company_phone =", value, "companyPhone");
            return (Criteria) this;
        }

        public Criteria andCompanyPhoneNotEqualTo(String value) {
            addCriterion("company_phone <>", value, "companyPhone");
            return (Criteria) this;
        }

        public Criteria andCompanyPhoneGreaterThan(String value) {
            addCriterion("company_phone >", value, "companyPhone");
            return (Criteria) this;
        }

        public Criteria andCompanyPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("company_phone >=", value, "companyPhone");
            return (Criteria) this;
        }

        public Criteria andCompanyPhoneLessThan(String value) {
            addCriterion("company_phone <", value, "companyPhone");
            return (Criteria) this;
        }

        public Criteria andCompanyPhoneLessThanOrEqualTo(String value) {
            addCriterion("company_phone <=", value, "companyPhone");
            return (Criteria) this;
        }

        public Criteria andCompanyPhoneLike(String value) {
            addCriterion("company_phone like", value, "companyPhone");
            return (Criteria) this;
        }

        public Criteria andCompanyPhoneNotLike(String value) {
            addCriterion("company_phone not like", value, "companyPhone");
            return (Criteria) this;
        }

        public Criteria andCompanyPhoneIn(List<String> values) {
            addCriterion("company_phone in", values, "companyPhone");
            return (Criteria) this;
        }

        public Criteria andCompanyPhoneNotIn(List<String> values) {
            addCriterion("company_phone not in", values, "companyPhone");
            return (Criteria) this;
        }

        public Criteria andCompanyPhoneBetween(String value1, String value2) {
            addCriterion("company_phone between", value1, value2, "companyPhone");
            return (Criteria) this;
        }

        public Criteria andCompanyPhoneNotBetween(String value1, String value2) {
            addCriterion("company_phone not between", value1, value2, "companyPhone");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailIsNull() {
            addCriterion("company_email is null");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailIsNotNull() {
            addCriterion("company_email is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailEqualTo(String value) {
            addCriterion("company_email =", value, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailNotEqualTo(String value) {
            addCriterion("company_email <>", value, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailGreaterThan(String value) {
            addCriterion("company_email >", value, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailGreaterThanOrEqualTo(String value) {
            addCriterion("company_email >=", value, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailLessThan(String value) {
            addCriterion("company_email <", value, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailLessThanOrEqualTo(String value) {
            addCriterion("company_email <=", value, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailLike(String value) {
            addCriterion("company_email like", value, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailNotLike(String value) {
            addCriterion("company_email not like", value, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailIn(List<String> values) {
            addCriterion("company_email in", values, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailNotIn(List<String> values) {
            addCriterion("company_email not in", values, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailBetween(String value1, String value2) {
            addCriterion("company_email between", value1, value2, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailNotBetween(String value1, String value2) {
            addCriterion("company_email not between", value1, value2, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyPwdIsNull() {
            addCriterion("company_pwd is null");
            return (Criteria) this;
        }

        public Criteria andCompanyPwdIsNotNull() {
            addCriterion("company_pwd is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyPwdEqualTo(String value) {
            addCriterion("company_pwd =", value, "companyPwd");
            return (Criteria) this;
        }

        public Criteria andCompanyPwdNotEqualTo(String value) {
            addCriterion("company_pwd <>", value, "companyPwd");
            return (Criteria) this;
        }

        public Criteria andCompanyPwdGreaterThan(String value) {
            addCriterion("company_pwd >", value, "companyPwd");
            return (Criteria) this;
        }

        public Criteria andCompanyPwdGreaterThanOrEqualTo(String value) {
            addCriterion("company_pwd >=", value, "companyPwd");
            return (Criteria) this;
        }

        public Criteria andCompanyPwdLessThan(String value) {
            addCriterion("company_pwd <", value, "companyPwd");
            return (Criteria) this;
        }

        public Criteria andCompanyPwdLessThanOrEqualTo(String value) {
            addCriterion("company_pwd <=", value, "companyPwd");
            return (Criteria) this;
        }

        public Criteria andCompanyPwdLike(String value) {
            addCriterion("company_pwd like", value, "companyPwd");
            return (Criteria) this;
        }

        public Criteria andCompanyPwdNotLike(String value) {
            addCriterion("company_pwd not like", value, "companyPwd");
            return (Criteria) this;
        }

        public Criteria andCompanyPwdIn(List<String> values) {
            addCriterion("company_pwd in", values, "companyPwd");
            return (Criteria) this;
        }

        public Criteria andCompanyPwdNotIn(List<String> values) {
            addCriterion("company_pwd not in", values, "companyPwd");
            return (Criteria) this;
        }

        public Criteria andCompanyPwdBetween(String value1, String value2) {
            addCriterion("company_pwd between", value1, value2, "companyPwd");
            return (Criteria) this;
        }

        public Criteria andCompanyPwdNotBetween(String value1, String value2) {
            addCriterion("company_pwd not between", value1, value2, "companyPwd");
            return (Criteria) this;
        }

        public Criteria andCompanyLogoIsNull() {
            addCriterion("company_logo is null");
            return (Criteria) this;
        }

        public Criteria andCompanyLogoIsNotNull() {
            addCriterion("company_logo is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyLogoEqualTo(String value) {
            addCriterion("company_logo =", value, "companyLogo");
            return (Criteria) this;
        }

        public Criteria andCompanyLogoNotEqualTo(String value) {
            addCriterion("company_logo <>", value, "companyLogo");
            return (Criteria) this;
        }

        public Criteria andCompanyLogoGreaterThan(String value) {
            addCriterion("company_logo >", value, "companyLogo");
            return (Criteria) this;
        }

        public Criteria andCompanyLogoGreaterThanOrEqualTo(String value) {
            addCriterion("company_logo >=", value, "companyLogo");
            return (Criteria) this;
        }

        public Criteria andCompanyLogoLessThan(String value) {
            addCriterion("company_logo <", value, "companyLogo");
            return (Criteria) this;
        }

        public Criteria andCompanyLogoLessThanOrEqualTo(String value) {
            addCriterion("company_logo <=", value, "companyLogo");
            return (Criteria) this;
        }

        public Criteria andCompanyLogoLike(String value) {
            addCriterion("company_logo like", value, "companyLogo");
            return (Criteria) this;
        }

        public Criteria andCompanyLogoNotLike(String value) {
            addCriterion("company_logo not like", value, "companyLogo");
            return (Criteria) this;
        }

        public Criteria andCompanyLogoIn(List<String> values) {
            addCriterion("company_logo in", values, "companyLogo");
            return (Criteria) this;
        }

        public Criteria andCompanyLogoNotIn(List<String> values) {
            addCriterion("company_logo not in", values, "companyLogo");
            return (Criteria) this;
        }

        public Criteria andCompanyLogoBetween(String value1, String value2) {
            addCriterion("company_logo between", value1, value2, "companyLogo");
            return (Criteria) this;
        }

        public Criteria andCompanyLogoNotBetween(String value1, String value2) {
            addCriterion("company_logo not between", value1, value2, "companyLogo");
            return (Criteria) this;
        }

        public Criteria andCompanyWebsiteIsNull() {
            addCriterion("company_website is null");
            return (Criteria) this;
        }

        public Criteria andCompanyWebsiteIsNotNull() {
            addCriterion("company_website is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyWebsiteEqualTo(String value) {
            addCriterion("company_website =", value, "companyWebsite");
            return (Criteria) this;
        }

        public Criteria andCompanyWebsiteNotEqualTo(String value) {
            addCriterion("company_website <>", value, "companyWebsite");
            return (Criteria) this;
        }

        public Criteria andCompanyWebsiteGreaterThan(String value) {
            addCriterion("company_website >", value, "companyWebsite");
            return (Criteria) this;
        }

        public Criteria andCompanyWebsiteGreaterThanOrEqualTo(String value) {
            addCriterion("company_website >=", value, "companyWebsite");
            return (Criteria) this;
        }

        public Criteria andCompanyWebsiteLessThan(String value) {
            addCriterion("company_website <", value, "companyWebsite");
            return (Criteria) this;
        }

        public Criteria andCompanyWebsiteLessThanOrEqualTo(String value) {
            addCriterion("company_website <=", value, "companyWebsite");
            return (Criteria) this;
        }

        public Criteria andCompanyWebsiteLike(String value) {
            addCriterion("company_website like", value, "companyWebsite");
            return (Criteria) this;
        }

        public Criteria andCompanyWebsiteNotLike(String value) {
            addCriterion("company_website not like", value, "companyWebsite");
            return (Criteria) this;
        }

        public Criteria andCompanyWebsiteIn(List<String> values) {
            addCriterion("company_website in", values, "companyWebsite");
            return (Criteria) this;
        }

        public Criteria andCompanyWebsiteNotIn(List<String> values) {
            addCriterion("company_website not in", values, "companyWebsite");
            return (Criteria) this;
        }

        public Criteria andCompanyWebsiteBetween(String value1, String value2) {
            addCriterion("company_website between", value1, value2, "companyWebsite");
            return (Criteria) this;
        }

        public Criteria andCompanyWebsiteNotBetween(String value1, String value2) {
            addCriterion("company_website not between", value1, value2, "companyWebsite");
            return (Criteria) this;
        }

        public Criteria andCompanyCityIsNull() {
            addCriterion("company_city is null");
            return (Criteria) this;
        }

        public Criteria andCompanyCityIsNotNull() {
            addCriterion("company_city is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyCityEqualTo(String value) {
            addCriterion("company_city =", value, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityNotEqualTo(String value) {
            addCriterion("company_city <>", value, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityGreaterThan(String value) {
            addCriterion("company_city >", value, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityGreaterThanOrEqualTo(String value) {
            addCriterion("company_city >=", value, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityLessThan(String value) {
            addCriterion("company_city <", value, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityLessThanOrEqualTo(String value) {
            addCriterion("company_city <=", value, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityLike(String value) {
            addCriterion("company_city like", value, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityNotLike(String value) {
            addCriterion("company_city not like", value, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityIn(List<String> values) {
            addCriterion("company_city in", values, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityNotIn(List<String> values) {
            addCriterion("company_city not in", values, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityBetween(String value1, String value2) {
            addCriterion("company_city between", value1, value2, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityNotBetween(String value1, String value2) {
            addCriterion("company_city not between", value1, value2, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyPositionIsNull() {
            addCriterion("company_position is null");
            return (Criteria) this;
        }

        public Criteria andCompanyPositionIsNotNull() {
            addCriterion("company_position is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyPositionEqualTo(String value) {
            addCriterion("company_position =", value, "companyPosition");
            return (Criteria) this;
        }

        public Criteria andCompanyPositionNotEqualTo(String value) {
            addCriterion("company_position <>", value, "companyPosition");
            return (Criteria) this;
        }

        public Criteria andCompanyPositionGreaterThan(String value) {
            addCriterion("company_position >", value, "companyPosition");
            return (Criteria) this;
        }

        public Criteria andCompanyPositionGreaterThanOrEqualTo(String value) {
            addCriterion("company_position >=", value, "companyPosition");
            return (Criteria) this;
        }

        public Criteria andCompanyPositionLessThan(String value) {
            addCriterion("company_position <", value, "companyPosition");
            return (Criteria) this;
        }

        public Criteria andCompanyPositionLessThanOrEqualTo(String value) {
            addCriterion("company_position <=", value, "companyPosition");
            return (Criteria) this;
        }

        public Criteria andCompanyPositionLike(String value) {
            addCriterion("company_position like", value, "companyPosition");
            return (Criteria) this;
        }

        public Criteria andCompanyPositionNotLike(String value) {
            addCriterion("company_position not like", value, "companyPosition");
            return (Criteria) this;
        }

        public Criteria andCompanyPositionIn(List<String> values) {
            addCriterion("company_position in", values, "companyPosition");
            return (Criteria) this;
        }

        public Criteria andCompanyPositionNotIn(List<String> values) {
            addCriterion("company_position not in", values, "companyPosition");
            return (Criteria) this;
        }

        public Criteria andCompanyPositionBetween(String value1, String value2) {
            addCriterion("company_position between", value1, value2, "companyPosition");
            return (Criteria) this;
        }

        public Criteria andCompanyPositionNotBetween(String value1, String value2) {
            addCriterion("company_position not between", value1, value2, "companyPosition");
            return (Criteria) this;
        }

        public Criteria andFieldIsNull() {
            addCriterion("field is null");
            return (Criteria) this;
        }

        public Criteria andFieldIsNotNull() {
            addCriterion("field is not null");
            return (Criteria) this;
        }

        public Criteria andFieldEqualTo(String value) {
            addCriterion("field =", value, "field");
            return (Criteria) this;
        }

        public Criteria andFieldNotEqualTo(String value) {
            addCriterion("field <>", value, "field");
            return (Criteria) this;
        }

        public Criteria andFieldGreaterThan(String value) {
            addCriterion("field >", value, "field");
            return (Criteria) this;
        }

        public Criteria andFieldGreaterThanOrEqualTo(String value) {
            addCriterion("field >=", value, "field");
            return (Criteria) this;
        }

        public Criteria andFieldLessThan(String value) {
            addCriterion("field <", value, "field");
            return (Criteria) this;
        }

        public Criteria andFieldLessThanOrEqualTo(String value) {
            addCriterion("field <=", value, "field");
            return (Criteria) this;
        }

        public Criteria andFieldLike(String value) {
            addCriterion("field like", value, "field");
            return (Criteria) this;
        }

        public Criteria andFieldNotLike(String value) {
            addCriterion("field not like", value, "field");
            return (Criteria) this;
        }

        public Criteria andFieldIn(List<String> values) {
            addCriterion("field in", values, "field");
            return (Criteria) this;
        }

        public Criteria andFieldNotIn(List<String> values) {
            addCriterion("field not in", values, "field");
            return (Criteria) this;
        }

        public Criteria andFieldBetween(String value1, String value2) {
            addCriterion("field between", value1, value2, "field");
            return (Criteria) this;
        }

        public Criteria andFieldNotBetween(String value1, String value2) {
            addCriterion("field not between", value1, value2, "field");
            return (Criteria) this;
        }

        public Criteria andScaleIsNull() {
            addCriterion("scale is null");
            return (Criteria) this;
        }

        public Criteria andScaleIsNotNull() {
            addCriterion("scale is not null");
            return (Criteria) this;
        }

        public Criteria andScaleEqualTo(String value) {
            addCriterion("scale =", value, "scale");
            return (Criteria) this;
        }

        public Criteria andScaleNotEqualTo(String value) {
            addCriterion("scale <>", value, "scale");
            return (Criteria) this;
        }

        public Criteria andScaleGreaterThan(String value) {
            addCriterion("scale >", value, "scale");
            return (Criteria) this;
        }

        public Criteria andScaleGreaterThanOrEqualTo(String value) {
            addCriterion("scale >=", value, "scale");
            return (Criteria) this;
        }

        public Criteria andScaleLessThan(String value) {
            addCriterion("scale <", value, "scale");
            return (Criteria) this;
        }

        public Criteria andScaleLessThanOrEqualTo(String value) {
            addCriterion("scale <=", value, "scale");
            return (Criteria) this;
        }

        public Criteria andScaleLike(String value) {
            addCriterion("scale like", value, "scale");
            return (Criteria) this;
        }

        public Criteria andScaleNotLike(String value) {
            addCriterion("scale not like", value, "scale");
            return (Criteria) this;
        }

        public Criteria andScaleIn(List<String> values) {
            addCriterion("scale in", values, "scale");
            return (Criteria) this;
        }

        public Criteria andScaleNotIn(List<String> values) {
            addCriterion("scale not in", values, "scale");
            return (Criteria) this;
        }

        public Criteria andScaleBetween(String value1, String value2) {
            addCriterion("scale between", value1, value2, "scale");
            return (Criteria) this;
        }

        public Criteria andScaleNotBetween(String value1, String value2) {
            addCriterion("scale not between", value1, value2, "scale");
            return (Criteria) this;
        }

        public Criteria andStageIsNull() {
            addCriterion("stage is null");
            return (Criteria) this;
        }

        public Criteria andStageIsNotNull() {
            addCriterion("stage is not null");
            return (Criteria) this;
        }

        public Criteria andStageEqualTo(String value) {
            addCriterion("stage =", value, "stage");
            return (Criteria) this;
        }

        public Criteria andStageNotEqualTo(String value) {
            addCriterion("stage <>", value, "stage");
            return (Criteria) this;
        }

        public Criteria andStageGreaterThan(String value) {
            addCriterion("stage >", value, "stage");
            return (Criteria) this;
        }

        public Criteria andStageGreaterThanOrEqualTo(String value) {
            addCriterion("stage >=", value, "stage");
            return (Criteria) this;
        }

        public Criteria andStageLessThan(String value) {
            addCriterion("stage <", value, "stage");
            return (Criteria) this;
        }

        public Criteria andStageLessThanOrEqualTo(String value) {
            addCriterion("stage <=", value, "stage");
            return (Criteria) this;
        }

        public Criteria andStageLike(String value) {
            addCriterion("stage like", value, "stage");
            return (Criteria) this;
        }

        public Criteria andStageNotLike(String value) {
            addCriterion("stage not like", value, "stage");
            return (Criteria) this;
        }

        public Criteria andStageIn(List<String> values) {
            addCriterion("stage in", values, "stage");
            return (Criteria) this;
        }

        public Criteria andStageNotIn(List<String> values) {
            addCriterion("stage not in", values, "stage");
            return (Criteria) this;
        }

        public Criteria andStageBetween(String value1, String value2) {
            addCriterion("stage between", value1, value2, "stage");
            return (Criteria) this;
        }

        public Criteria andStageNotBetween(String value1, String value2) {
            addCriterion("stage not between", value1, value2, "stage");
            return (Criteria) this;
        }

        public Criteria andTagIsNull() {
            addCriterion("tag is null");
            return (Criteria) this;
        }

        public Criteria andTagIsNotNull() {
            addCriterion("tag is not null");
            return (Criteria) this;
        }

        public Criteria andTagEqualTo(String value) {
            addCriterion("tag =", value, "tag");
            return (Criteria) this;
        }

        public Criteria andTagNotEqualTo(String value) {
            addCriterion("tag <>", value, "tag");
            return (Criteria) this;
        }

        public Criteria andTagGreaterThan(String value) {
            addCriterion("tag >", value, "tag");
            return (Criteria) this;
        }

        public Criteria andTagGreaterThanOrEqualTo(String value) {
            addCriterion("tag >=", value, "tag");
            return (Criteria) this;
        }

        public Criteria andTagLessThan(String value) {
            addCriterion("tag <", value, "tag");
            return (Criteria) this;
        }

        public Criteria andTagLessThanOrEqualTo(String value) {
            addCriterion("tag <=", value, "tag");
            return (Criteria) this;
        }

        public Criteria andTagLike(String value) {
            addCriterion("tag like", value, "tag");
            return (Criteria) this;
        }

        public Criteria andTagNotLike(String value) {
            addCriterion("tag not like", value, "tag");
            return (Criteria) this;
        }

        public Criteria andTagIn(List<String> values) {
            addCriterion("tag in", values, "tag");
            return (Criteria) this;
        }

        public Criteria andTagNotIn(List<String> values) {
            addCriterion("tag not in", values, "tag");
            return (Criteria) this;
        }

        public Criteria andTagBetween(String value1, String value2) {
            addCriterion("tag between", value1, value2, "tag");
            return (Criteria) this;
        }

        public Criteria andTagNotBetween(String value1, String value2) {
            addCriterion("tag not between", value1, value2, "tag");
            return (Criteria) this;
        }

        public Criteria andReceiveEmailIsNull() {
            addCriterion("receive_email is null");
            return (Criteria) this;
        }

        public Criteria andReceiveEmailIsNotNull() {
            addCriterion("receive_email is not null");
            return (Criteria) this;
        }

        public Criteria andReceiveEmailEqualTo(String value) {
            addCriterion("receive_email =", value, "receiveEmail");
            return (Criteria) this;
        }

        public Criteria andReceiveEmailNotEqualTo(String value) {
            addCriterion("receive_email <>", value, "receiveEmail");
            return (Criteria) this;
        }

        public Criteria andReceiveEmailGreaterThan(String value) {
            addCriterion("receive_email >", value, "receiveEmail");
            return (Criteria) this;
        }

        public Criteria andReceiveEmailGreaterThanOrEqualTo(String value) {
            addCriterion("receive_email >=", value, "receiveEmail");
            return (Criteria) this;
        }

        public Criteria andReceiveEmailLessThan(String value) {
            addCriterion("receive_email <", value, "receiveEmail");
            return (Criteria) this;
        }

        public Criteria andReceiveEmailLessThanOrEqualTo(String value) {
            addCriterion("receive_email <=", value, "receiveEmail");
            return (Criteria) this;
        }

        public Criteria andReceiveEmailLike(String value) {
            addCriterion("receive_email like", value, "receiveEmail");
            return (Criteria) this;
        }

        public Criteria andReceiveEmailNotLike(String value) {
            addCriterion("receive_email not like", value, "receiveEmail");
            return (Criteria) this;
        }

        public Criteria andReceiveEmailIn(List<String> values) {
            addCriterion("receive_email in", values, "receiveEmail");
            return (Criteria) this;
        }

        public Criteria andReceiveEmailNotIn(List<String> values) {
            addCriterion("receive_email not in", values, "receiveEmail");
            return (Criteria) this;
        }

        public Criteria andReceiveEmailBetween(String value1, String value2) {
            addCriterion("receive_email between", value1, value2, "receiveEmail");
            return (Criteria) this;
        }

        public Criteria andReceiveEmailNotBetween(String value1, String value2) {
            addCriterion("receive_email not between", value1, value2, "receiveEmail");
            return (Criteria) this;
        }

        public Criteria andAllnameIsNull() {
            addCriterion("allname is null");
            return (Criteria) this;
        }

        public Criteria andAllnameIsNotNull() {
            addCriterion("allname is not null");
            return (Criteria) this;
        }

        public Criteria andAllnameEqualTo(String value) {
            addCriterion("allname =", value, "allname");
            return (Criteria) this;
        }

        public Criteria andAllnameNotEqualTo(String value) {
            addCriterion("allname <>", value, "allname");
            return (Criteria) this;
        }

        public Criteria andAllnameGreaterThan(String value) {
            addCriterion("allname >", value, "allname");
            return (Criteria) this;
        }

        public Criteria andAllnameGreaterThanOrEqualTo(String value) {
            addCriterion("allname >=", value, "allname");
            return (Criteria) this;
        }

        public Criteria andAllnameLessThan(String value) {
            addCriterion("allname <", value, "allname");
            return (Criteria) this;
        }

        public Criteria andAllnameLessThanOrEqualTo(String value) {
            addCriterion("allname <=", value, "allname");
            return (Criteria) this;
        }

        public Criteria andAllnameLike(String value) {
            addCriterion("allname like", value, "allname");
            return (Criteria) this;
        }

        public Criteria andAllnameNotLike(String value) {
            addCriterion("allname not like", value, "allname");
            return (Criteria) this;
        }

        public Criteria andAllnameIn(List<String> values) {
            addCriterion("allname in", values, "allname");
            return (Criteria) this;
        }

        public Criteria andAllnameNotIn(List<String> values) {
            addCriterion("allname not in", values, "allname");
            return (Criteria) this;
        }

        public Criteria andAllnameBetween(String value1, String value2) {
            addCriterion("allname between", value1, value2, "allname");
            return (Criteria) this;
        }

        public Criteria andAllnameNotBetween(String value1, String value2) {
            addCriterion("allname not between", value1, value2, "allname");
            return (Criteria) this;
        }

        public Criteria andIsAuthenticationIsNull() {
            addCriterion("is_authentication is null");
            return (Criteria) this;
        }

        public Criteria andIsAuthenticationIsNotNull() {
            addCriterion("is_authentication is not null");
            return (Criteria) this;
        }

        public Criteria andIsAuthenticationEqualTo(String value) {
            addCriterion("is_authentication =", value, "isAuthentication");
            return (Criteria) this;
        }

        public Criteria andIsAuthenticationNotEqualTo(String value) {
            addCriterion("is_authentication <>", value, "isAuthentication");
            return (Criteria) this;
        }

        public Criteria andIsAuthenticationGreaterThan(String value) {
            addCriterion("is_authentication >", value, "isAuthentication");
            return (Criteria) this;
        }

        public Criteria andIsAuthenticationGreaterThanOrEqualTo(String value) {
            addCriterion("is_authentication >=", value, "isAuthentication");
            return (Criteria) this;
        }

        public Criteria andIsAuthenticationLessThan(String value) {
            addCriterion("is_authentication <", value, "isAuthentication");
            return (Criteria) this;
        }

        public Criteria andIsAuthenticationLessThanOrEqualTo(String value) {
            addCriterion("is_authentication <=", value, "isAuthentication");
            return (Criteria) this;
        }

        public Criteria andIsAuthenticationLike(String value) {
            addCriterion("is_authentication like", value, "isAuthentication");
            return (Criteria) this;
        }

        public Criteria andIsAuthenticationNotLike(String value) {
            addCriterion("is_authentication not like", value, "isAuthentication");
            return (Criteria) this;
        }

        public Criteria andIsAuthenticationIn(List<String> values) {
            addCriterion("is_authentication in", values, "isAuthentication");
            return (Criteria) this;
        }

        public Criteria andIsAuthenticationNotIn(List<String> values) {
            addCriterion("is_authentication not in", values, "isAuthentication");
            return (Criteria) this;
        }

        public Criteria andIsAuthenticationBetween(String value1, String value2) {
            addCriterion("is_authentication between", value1, value2, "isAuthentication");
            return (Criteria) this;
        }

        public Criteria andIsAuthenticationNotBetween(String value1, String value2) {
            addCriterion("is_authentication not between", value1, value2, "isAuthentication");
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