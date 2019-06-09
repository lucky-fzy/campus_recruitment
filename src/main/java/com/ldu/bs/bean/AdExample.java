package com.ldu.bs.bean;

import java.util.ArrayList;
import java.util.List;

public class AdExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AdExample() {
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

        public Criteria andAdIdIsNull() {
            addCriterion("ad_id is null");
            return (Criteria) this;
        }

        public Criteria andAdIdIsNotNull() {
            addCriterion("ad_id is not null");
            return (Criteria) this;
        }

        public Criteria andAdIdEqualTo(Integer value) {
            addCriterion("ad_id =", value, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdNotEqualTo(Integer value) {
            addCriterion("ad_id <>", value, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdGreaterThan(Integer value) {
            addCriterion("ad_id >", value, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("ad_id >=", value, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdLessThan(Integer value) {
            addCriterion("ad_id <", value, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdLessThanOrEqualTo(Integer value) {
            addCriterion("ad_id <=", value, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdIn(List<Integer> values) {
            addCriterion("ad_id in", values, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdNotIn(List<Integer> values) {
            addCriterion("ad_id not in", values, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdBetween(Integer value1, Integer value2) {
            addCriterion("ad_id between", value1, value2, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdNotBetween(Integer value1, Integer value2) {
            addCriterion("ad_id not between", value1, value2, "adId");
            return (Criteria) this;
        }

        public Criteria andAdImgIsNull() {
            addCriterion("ad_img is null");
            return (Criteria) this;
        }

        public Criteria andAdImgIsNotNull() {
            addCriterion("ad_img is not null");
            return (Criteria) this;
        }

        public Criteria andAdImgEqualTo(String value) {
            addCriterion("ad_img =", value, "adImg");
            return (Criteria) this;
        }

        public Criteria andAdImgNotEqualTo(String value) {
            addCriterion("ad_img <>", value, "adImg");
            return (Criteria) this;
        }

        public Criteria andAdImgGreaterThan(String value) {
            addCriterion("ad_img >", value, "adImg");
            return (Criteria) this;
        }

        public Criteria andAdImgGreaterThanOrEqualTo(String value) {
            addCriterion("ad_img >=", value, "adImg");
            return (Criteria) this;
        }

        public Criteria andAdImgLessThan(String value) {
            addCriterion("ad_img <", value, "adImg");
            return (Criteria) this;
        }

        public Criteria andAdImgLessThanOrEqualTo(String value) {
            addCriterion("ad_img <=", value, "adImg");
            return (Criteria) this;
        }

        public Criteria andAdImgLike(String value) {
            addCriterion("ad_img like", value, "adImg");
            return (Criteria) this;
        }

        public Criteria andAdImgNotLike(String value) {
            addCriterion("ad_img not like", value, "adImg");
            return (Criteria) this;
        }

        public Criteria andAdImgIn(List<String> values) {
            addCriterion("ad_img in", values, "adImg");
            return (Criteria) this;
        }

        public Criteria andAdImgNotIn(List<String> values) {
            addCriterion("ad_img not in", values, "adImg");
            return (Criteria) this;
        }

        public Criteria andAdImgBetween(String value1, String value2) {
            addCriterion("ad_img between", value1, value2, "adImg");
            return (Criteria) this;
        }

        public Criteria andAdImgNotBetween(String value1, String value2) {
            addCriterion("ad_img not between", value1, value2, "adImg");
            return (Criteria) this;
        }

        public Criteria andAdNameIsNull() {
            addCriterion("ad_name is null");
            return (Criteria) this;
        }

        public Criteria andAdNameIsNotNull() {
            addCriterion("ad_name is not null");
            return (Criteria) this;
        }

        public Criteria andAdNameEqualTo(String value) {
            addCriterion("ad_name =", value, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameNotEqualTo(String value) {
            addCriterion("ad_name <>", value, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameGreaterThan(String value) {
            addCriterion("ad_name >", value, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameGreaterThanOrEqualTo(String value) {
            addCriterion("ad_name >=", value, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameLessThan(String value) {
            addCriterion("ad_name <", value, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameLessThanOrEqualTo(String value) {
            addCriterion("ad_name <=", value, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameLike(String value) {
            addCriterion("ad_name like", value, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameNotLike(String value) {
            addCriterion("ad_name not like", value, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameIn(List<String> values) {
            addCriterion("ad_name in", values, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameNotIn(List<String> values) {
            addCriterion("ad_name not in", values, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameBetween(String value1, String value2) {
            addCriterion("ad_name between", value1, value2, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameNotBetween(String value1, String value2) {
            addCriterion("ad_name not between", value1, value2, "adName");
            return (Criteria) this;
        }

        public Criteria andAdDescribeIsNull() {
            addCriterion("ad_describe is null");
            return (Criteria) this;
        }

        public Criteria andAdDescribeIsNotNull() {
            addCriterion("ad_describe is not null");
            return (Criteria) this;
        }

        public Criteria andAdDescribeEqualTo(String value) {
            addCriterion("ad_describe =", value, "adDescribe");
            return (Criteria) this;
        }

        public Criteria andAdDescribeNotEqualTo(String value) {
            addCriterion("ad_describe <>", value, "adDescribe");
            return (Criteria) this;
        }

        public Criteria andAdDescribeGreaterThan(String value) {
            addCriterion("ad_describe >", value, "adDescribe");
            return (Criteria) this;
        }

        public Criteria andAdDescribeGreaterThanOrEqualTo(String value) {
            addCriterion("ad_describe >=", value, "adDescribe");
            return (Criteria) this;
        }

        public Criteria andAdDescribeLessThan(String value) {
            addCriterion("ad_describe <", value, "adDescribe");
            return (Criteria) this;
        }

        public Criteria andAdDescribeLessThanOrEqualTo(String value) {
            addCriterion("ad_describe <=", value, "adDescribe");
            return (Criteria) this;
        }

        public Criteria andAdDescribeLike(String value) {
            addCriterion("ad_describe like", value, "adDescribe");
            return (Criteria) this;
        }

        public Criteria andAdDescribeNotLike(String value) {
            addCriterion("ad_describe not like", value, "adDescribe");
            return (Criteria) this;
        }

        public Criteria andAdDescribeIn(List<String> values) {
            addCriterion("ad_describe in", values, "adDescribe");
            return (Criteria) this;
        }

        public Criteria andAdDescribeNotIn(List<String> values) {
            addCriterion("ad_describe not in", values, "adDescribe");
            return (Criteria) this;
        }

        public Criteria andAdDescribeBetween(String value1, String value2) {
            addCriterion("ad_describe between", value1, value2, "adDescribe");
            return (Criteria) this;
        }

        public Criteria andAdDescribeNotBetween(String value1, String value2) {
            addCriterion("ad_describe not between", value1, value2, "adDescribe");
            return (Criteria) this;
        }

        public Criteria andAdSiteIsNull() {
            addCriterion("ad_site is null");
            return (Criteria) this;
        }

        public Criteria andAdSiteIsNotNull() {
            addCriterion("ad_site is not null");
            return (Criteria) this;
        }

        public Criteria andAdSiteEqualTo(String value) {
            addCriterion("ad_site =", value, "adSite");
            return (Criteria) this;
        }

        public Criteria andAdSiteNotEqualTo(String value) {
            addCriterion("ad_site <>", value, "adSite");
            return (Criteria) this;
        }

        public Criteria andAdSiteGreaterThan(String value) {
            addCriterion("ad_site >", value, "adSite");
            return (Criteria) this;
        }

        public Criteria andAdSiteGreaterThanOrEqualTo(String value) {
            addCriterion("ad_site >=", value, "adSite");
            return (Criteria) this;
        }

        public Criteria andAdSiteLessThan(String value) {
            addCriterion("ad_site <", value, "adSite");
            return (Criteria) this;
        }

        public Criteria andAdSiteLessThanOrEqualTo(String value) {
            addCriterion("ad_site <=", value, "adSite");
            return (Criteria) this;
        }

        public Criteria andAdSiteLike(String value) {
            addCriterion("ad_site like", value, "adSite");
            return (Criteria) this;
        }

        public Criteria andAdSiteNotLike(String value) {
            addCriterion("ad_site not like", value, "adSite");
            return (Criteria) this;
        }

        public Criteria andAdSiteIn(List<String> values) {
            addCriterion("ad_site in", values, "adSite");
            return (Criteria) this;
        }

        public Criteria andAdSiteNotIn(List<String> values) {
            addCriterion("ad_site not in", values, "adSite");
            return (Criteria) this;
        }

        public Criteria andAdSiteBetween(String value1, String value2) {
            addCriterion("ad_site between", value1, value2, "adSite");
            return (Criteria) this;
        }

        public Criteria andAdSiteNotBetween(String value1, String value2) {
            addCriterion("ad_site not between", value1, value2, "adSite");
            return (Criteria) this;
        }

        public Criteria andIsOnlineIsNull() {
            addCriterion("is_online is null");
            return (Criteria) this;
        }

        public Criteria andIsOnlineIsNotNull() {
            addCriterion("is_online is not null");
            return (Criteria) this;
        }

        public Criteria andIsOnlineEqualTo(String value) {
            addCriterion("is_online =", value, "isOnline");
            return (Criteria) this;
        }

        public Criteria andIsOnlineNotEqualTo(String value) {
            addCriterion("is_online <>", value, "isOnline");
            return (Criteria) this;
        }

        public Criteria andIsOnlineGreaterThan(String value) {
            addCriterion("is_online >", value, "isOnline");
            return (Criteria) this;
        }

        public Criteria andIsOnlineGreaterThanOrEqualTo(String value) {
            addCriterion("is_online >=", value, "isOnline");
            return (Criteria) this;
        }

        public Criteria andIsOnlineLessThan(String value) {
            addCriterion("is_online <", value, "isOnline");
            return (Criteria) this;
        }

        public Criteria andIsOnlineLessThanOrEqualTo(String value) {
            addCriterion("is_online <=", value, "isOnline");
            return (Criteria) this;
        }

        public Criteria andIsOnlineLike(String value) {
            addCriterion("is_online like", value, "isOnline");
            return (Criteria) this;
        }

        public Criteria andIsOnlineNotLike(String value) {
            addCriterion("is_online not like", value, "isOnline");
            return (Criteria) this;
        }

        public Criteria andIsOnlineIn(List<String> values) {
            addCriterion("is_online in", values, "isOnline");
            return (Criteria) this;
        }

        public Criteria andIsOnlineNotIn(List<String> values) {
            addCriterion("is_online not in", values, "isOnline");
            return (Criteria) this;
        }

        public Criteria andIsOnlineBetween(String value1, String value2) {
            addCriterion("is_online between", value1, value2, "isOnline");
            return (Criteria) this;
        }

        public Criteria andIsOnlineNotBetween(String value1, String value2) {
            addCriterion("is_online not between", value1, value2, "isOnline");
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