package com.ldu.bs.bean;

import java.util.ArrayList;
import java.util.List;

public class PositionExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public PositionExample() {
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

        public Criteria andPositionTypeIsNull() {
            addCriterion("position_type is null");
            return (Criteria) this;
        }

        public Criteria andPositionTypeIsNotNull() {
            addCriterion("position_type is not null");
            return (Criteria) this;
        }

        public Criteria andPositionTypeEqualTo(String value) {
            addCriterion("position_type =", value, "positionType");
            return (Criteria) this;
        }

        public Criteria andPositionTypeNotEqualTo(String value) {
            addCriterion("position_type <>", value, "positionType");
            return (Criteria) this;
        }

        public Criteria andPositionTypeGreaterThan(String value) {
            addCriterion("position_type >", value, "positionType");
            return (Criteria) this;
        }

        public Criteria andPositionTypeGreaterThanOrEqualTo(String value) {
            addCriterion("position_type >=", value, "positionType");
            return (Criteria) this;
        }

        public Criteria andPositionTypeLessThan(String value) {
            addCriterion("position_type <", value, "positionType");
            return (Criteria) this;
        }

        public Criteria andPositionTypeLessThanOrEqualTo(String value) {
            addCriterion("position_type <=", value, "positionType");
            return (Criteria) this;
        }

        public Criteria andPositionTypeLike(String value) {
            addCriterion("position_type like", value, "positionType");
            return (Criteria) this;
        }

        public Criteria andPositionTypeNotLike(String value) {
            addCriterion("position_type not like", value, "positionType");
            return (Criteria) this;
        }

        public Criteria andPositionTypeIn(List<String> values) {
            addCriterion("position_type in", values, "positionType");
            return (Criteria) this;
        }

        public Criteria andPositionTypeNotIn(List<String> values) {
            addCriterion("position_type not in", values, "positionType");
            return (Criteria) this;
        }

        public Criteria andPositionTypeBetween(String value1, String value2) {
            addCriterion("position_type between", value1, value2, "positionType");
            return (Criteria) this;
        }

        public Criteria andPositionTypeNotBetween(String value1, String value2) {
            addCriterion("position_type not between", value1, value2, "positionType");
            return (Criteria) this;
        }

        public Criteria andPositionNameIsNull() {
            addCriterion("position_name is null");
            return (Criteria) this;
        }

        public Criteria andPositionNameIsNotNull() {
            addCriterion("position_name is not null");
            return (Criteria) this;
        }

        public Criteria andPositionNameEqualTo(String value) {
            addCriterion("position_name =", value, "positionName");
            return (Criteria) this;
        }

        public Criteria andPositionNameNotEqualTo(String value) {
            addCriterion("position_name <>", value, "positionName");
            return (Criteria) this;
        }

        public Criteria andPositionNameGreaterThan(String value) {
            addCriterion("position_name >", value, "positionName");
            return (Criteria) this;
        }

        public Criteria andPositionNameGreaterThanOrEqualTo(String value) {
            addCriterion("position_name >=", value, "positionName");
            return (Criteria) this;
        }

        public Criteria andPositionNameLessThan(String value) {
            addCriterion("position_name <", value, "positionName");
            return (Criteria) this;
        }

        public Criteria andPositionNameLessThanOrEqualTo(String value) {
            addCriterion("position_name <=", value, "positionName");
            return (Criteria) this;
        }

        public Criteria andPositionNameLike(String value) {
            addCriterion("position_name like", value, "positionName");
            return (Criteria) this;
        }

        public Criteria andPositionNameNotLike(String value) {
            addCriterion("position_name not like", value, "positionName");
            return (Criteria) this;
        }

        public Criteria andPositionNameIn(List<String> values) {
            addCriterion("position_name in", values, "positionName");
            return (Criteria) this;
        }

        public Criteria andPositionNameNotIn(List<String> values) {
            addCriterion("position_name not in", values, "positionName");
            return (Criteria) this;
        }

        public Criteria andPositionNameBetween(String value1, String value2) {
            addCriterion("position_name between", value1, value2, "positionName");
            return (Criteria) this;
        }

        public Criteria andPositionNameNotBetween(String value1, String value2) {
            addCriterion("position_name not between", value1, value2, "positionName");
            return (Criteria) this;
        }

        public Criteria andDepartmentIsNull() {
            addCriterion("department is null");
            return (Criteria) this;
        }

        public Criteria andDepartmentIsNotNull() {
            addCriterion("department is not null");
            return (Criteria) this;
        }

        public Criteria andDepartmentEqualTo(String value) {
            addCriterion("department =", value, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentNotEqualTo(String value) {
            addCriterion("department <>", value, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentGreaterThan(String value) {
            addCriterion("department >", value, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentGreaterThanOrEqualTo(String value) {
            addCriterion("department >=", value, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentLessThan(String value) {
            addCriterion("department <", value, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentLessThanOrEqualTo(String value) {
            addCriterion("department <=", value, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentLike(String value) {
            addCriterion("department like", value, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentNotLike(String value) {
            addCriterion("department not like", value, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentIn(List<String> values) {
            addCriterion("department in", values, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentNotIn(List<String> values) {
            addCriterion("department not in", values, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentBetween(String value1, String value2) {
            addCriterion("department between", value1, value2, "department");
            return (Criteria) this;
        }

        public Criteria andDepartmentNotBetween(String value1, String value2) {
            addCriterion("department not between", value1, value2, "department");
            return (Criteria) this;
        }

        public Criteria andJobTypeIsNull() {
            addCriterion("job_type is null");
            return (Criteria) this;
        }

        public Criteria andJobTypeIsNotNull() {
            addCriterion("job_type is not null");
            return (Criteria) this;
        }

        public Criteria andJobTypeEqualTo(String value) {
            addCriterion("job_type =", value, "jobType");
            return (Criteria) this;
        }

        public Criteria andJobTypeNotEqualTo(String value) {
            addCriterion("job_type <>", value, "jobType");
            return (Criteria) this;
        }

        public Criteria andJobTypeGreaterThan(String value) {
            addCriterion("job_type >", value, "jobType");
            return (Criteria) this;
        }

        public Criteria andJobTypeGreaterThanOrEqualTo(String value) {
            addCriterion("job_type >=", value, "jobType");
            return (Criteria) this;
        }

        public Criteria andJobTypeLessThan(String value) {
            addCriterion("job_type <", value, "jobType");
            return (Criteria) this;
        }

        public Criteria andJobTypeLessThanOrEqualTo(String value) {
            addCriterion("job_type <=", value, "jobType");
            return (Criteria) this;
        }

        public Criteria andJobTypeLike(String value) {
            addCriterion("job_type like", value, "jobType");
            return (Criteria) this;
        }

        public Criteria andJobTypeNotLike(String value) {
            addCriterion("job_type not like", value, "jobType");
            return (Criteria) this;
        }

        public Criteria andJobTypeIn(List<String> values) {
            addCriterion("job_type in", values, "jobType");
            return (Criteria) this;
        }

        public Criteria andJobTypeNotIn(List<String> values) {
            addCriterion("job_type not in", values, "jobType");
            return (Criteria) this;
        }

        public Criteria andJobTypeBetween(String value1, String value2) {
            addCriterion("job_type between", value1, value2, "jobType");
            return (Criteria) this;
        }

        public Criteria andJobTypeNotBetween(String value1, String value2) {
            addCriterion("job_type not between", value1, value2, "jobType");
            return (Criteria) this;
        }

        public Criteria andMinSalaryIsNull() {
            addCriterion("min_salary is null");
            return (Criteria) this;
        }

        public Criteria andMinSalaryIsNotNull() {
            addCriterion("min_salary is not null");
            return (Criteria) this;
        }

        public Criteria andMinSalaryEqualTo(Integer value) {
            addCriterion("min_salary =", value, "minSalary");
            return (Criteria) this;
        }

        public Criteria andMinSalaryNotEqualTo(Integer value) {
            addCriterion("min_salary <>", value, "minSalary");
            return (Criteria) this;
        }

        public Criteria andMinSalaryGreaterThan(Integer value) {
            addCriterion("min_salary >", value, "minSalary");
            return (Criteria) this;
        }

        public Criteria andMinSalaryGreaterThanOrEqualTo(Integer value) {
            addCriterion("min_salary >=", value, "minSalary");
            return (Criteria) this;
        }

        public Criteria andMinSalaryLessThan(Integer value) {
            addCriterion("min_salary <", value, "minSalary");
            return (Criteria) this;
        }

        public Criteria andMinSalaryLessThanOrEqualTo(Integer value) {
            addCriterion("min_salary <=", value, "minSalary");
            return (Criteria) this;
        }

        public Criteria andMinSalaryIn(List<Integer> values) {
            addCriterion("min_salary in", values, "minSalary");
            return (Criteria) this;
        }

        public Criteria andMinSalaryNotIn(List<Integer> values) {
            addCriterion("min_salary not in", values, "minSalary");
            return (Criteria) this;
        }

        public Criteria andMinSalaryBetween(Integer value1, Integer value2) {
            addCriterion("min_salary between", value1, value2, "minSalary");
            return (Criteria) this;
        }

        public Criteria andMinSalaryNotBetween(Integer value1, Integer value2) {
            addCriterion("min_salary not between", value1, value2, "minSalary");
            return (Criteria) this;
        }

        public Criteria andMaxSalaryIsNull() {
            addCriterion("max_salary is null");
            return (Criteria) this;
        }

        public Criteria andMaxSalaryIsNotNull() {
            addCriterion("max_salary is not null");
            return (Criteria) this;
        }

        public Criteria andMaxSalaryEqualTo(Integer value) {
            addCriterion("max_salary =", value, "maxSalary");
            return (Criteria) this;
        }

        public Criteria andMaxSalaryNotEqualTo(Integer value) {
            addCriterion("max_salary <>", value, "maxSalary");
            return (Criteria) this;
        }

        public Criteria andMaxSalaryGreaterThan(Integer value) {
            addCriterion("max_salary >", value, "maxSalary");
            return (Criteria) this;
        }

        public Criteria andMaxSalaryGreaterThanOrEqualTo(Integer value) {
            addCriterion("max_salary >=", value, "maxSalary");
            return (Criteria) this;
        }

        public Criteria andMaxSalaryLessThan(Integer value) {
            addCriterion("max_salary <", value, "maxSalary");
            return (Criteria) this;
        }

        public Criteria andMaxSalaryLessThanOrEqualTo(Integer value) {
            addCriterion("max_salary <=", value, "maxSalary");
            return (Criteria) this;
        }

        public Criteria andMaxSalaryIn(List<Integer> values) {
            addCriterion("max_salary in", values, "maxSalary");
            return (Criteria) this;
        }

        public Criteria andMaxSalaryNotIn(List<Integer> values) {
            addCriterion("max_salary not in", values, "maxSalary");
            return (Criteria) this;
        }

        public Criteria andMaxSalaryBetween(Integer value1, Integer value2) {
            addCriterion("max_salary between", value1, value2, "maxSalary");
            return (Criteria) this;
        }

        public Criteria andMaxSalaryNotBetween(Integer value1, Integer value2) {
            addCriterion("max_salary not between", value1, value2, "maxSalary");
            return (Criteria) this;
        }

        public Criteria andJobCityIsNull() {
            addCriterion("job_city is null");
            return (Criteria) this;
        }

        public Criteria andJobCityIsNotNull() {
            addCriterion("job_city is not null");
            return (Criteria) this;
        }

        public Criteria andJobCityEqualTo(String value) {
            addCriterion("job_city =", value, "jobCity");
            return (Criteria) this;
        }

        public Criteria andJobCityNotEqualTo(String value) {
            addCriterion("job_city <>", value, "jobCity");
            return (Criteria) this;
        }

        public Criteria andJobCityGreaterThan(String value) {
            addCriterion("job_city >", value, "jobCity");
            return (Criteria) this;
        }

        public Criteria andJobCityGreaterThanOrEqualTo(String value) {
            addCriterion("job_city >=", value, "jobCity");
            return (Criteria) this;
        }

        public Criteria andJobCityLessThan(String value) {
            addCriterion("job_city <", value, "jobCity");
            return (Criteria) this;
        }

        public Criteria andJobCityLessThanOrEqualTo(String value) {
            addCriterion("job_city <=", value, "jobCity");
            return (Criteria) this;
        }

        public Criteria andJobCityLike(String value) {
            addCriterion("job_city like", value, "jobCity");
            return (Criteria) this;
        }

        public Criteria andJobCityNotLike(String value) {
            addCriterion("job_city not like", value, "jobCity");
            return (Criteria) this;
        }

        public Criteria andJobCityIn(List<String> values) {
            addCriterion("job_city in", values, "jobCity");
            return (Criteria) this;
        }

        public Criteria andJobCityNotIn(List<String> values) {
            addCriterion("job_city not in", values, "jobCity");
            return (Criteria) this;
        }

        public Criteria andJobCityBetween(String value1, String value2) {
            addCriterion("job_city between", value1, value2, "jobCity");
            return (Criteria) this;
        }

        public Criteria andJobCityNotBetween(String value1, String value2) {
            addCriterion("job_city not between", value1, value2, "jobCity");
            return (Criteria) this;
        }

        public Criteria andJobExperienceIsNull() {
            addCriterion("job_experience is null");
            return (Criteria) this;
        }

        public Criteria andJobExperienceIsNotNull() {
            addCriterion("job_experience is not null");
            return (Criteria) this;
        }

        public Criteria andJobExperienceEqualTo(String value) {
            addCriterion("job_experience =", value, "jobExperience");
            return (Criteria) this;
        }

        public Criteria andJobExperienceNotEqualTo(String value) {
            addCriterion("job_experience <>", value, "jobExperience");
            return (Criteria) this;
        }

        public Criteria andJobExperienceGreaterThan(String value) {
            addCriterion("job_experience >", value, "jobExperience");
            return (Criteria) this;
        }

        public Criteria andJobExperienceGreaterThanOrEqualTo(String value) {
            addCriterion("job_experience >=", value, "jobExperience");
            return (Criteria) this;
        }

        public Criteria andJobExperienceLessThan(String value) {
            addCriterion("job_experience <", value, "jobExperience");
            return (Criteria) this;
        }

        public Criteria andJobExperienceLessThanOrEqualTo(String value) {
            addCriterion("job_experience <=", value, "jobExperience");
            return (Criteria) this;
        }

        public Criteria andJobExperienceLike(String value) {
            addCriterion("job_experience like", value, "jobExperience");
            return (Criteria) this;
        }

        public Criteria andJobExperienceNotLike(String value) {
            addCriterion("job_experience not like", value, "jobExperience");
            return (Criteria) this;
        }

        public Criteria andJobExperienceIn(List<String> values) {
            addCriterion("job_experience in", values, "jobExperience");
            return (Criteria) this;
        }

        public Criteria andJobExperienceNotIn(List<String> values) {
            addCriterion("job_experience not in", values, "jobExperience");
            return (Criteria) this;
        }

        public Criteria andJobExperienceBetween(String value1, String value2) {
            addCriterion("job_experience between", value1, value2, "jobExperience");
            return (Criteria) this;
        }

        public Criteria andJobExperienceNotBetween(String value1, String value2) {
            addCriterion("job_experience not between", value1, value2, "jobExperience");
            return (Criteria) this;
        }

        public Criteria andDegreeIsNull() {
            addCriterion("degree is null");
            return (Criteria) this;
        }

        public Criteria andDegreeIsNotNull() {
            addCriterion("degree is not null");
            return (Criteria) this;
        }

        public Criteria andDegreeEqualTo(String value) {
            addCriterion("degree =", value, "degree");
            return (Criteria) this;
        }

        public Criteria andDegreeNotEqualTo(String value) {
            addCriterion("degree <>", value, "degree");
            return (Criteria) this;
        }

        public Criteria andDegreeGreaterThan(String value) {
            addCriterion("degree >", value, "degree");
            return (Criteria) this;
        }

        public Criteria andDegreeGreaterThanOrEqualTo(String value) {
            addCriterion("degree >=", value, "degree");
            return (Criteria) this;
        }

        public Criteria andDegreeLessThan(String value) {
            addCriterion("degree <", value, "degree");
            return (Criteria) this;
        }

        public Criteria andDegreeLessThanOrEqualTo(String value) {
            addCriterion("degree <=", value, "degree");
            return (Criteria) this;
        }

        public Criteria andDegreeLike(String value) {
            addCriterion("degree like", value, "degree");
            return (Criteria) this;
        }

        public Criteria andDegreeNotLike(String value) {
            addCriterion("degree not like", value, "degree");
            return (Criteria) this;
        }

        public Criteria andDegreeIn(List<String> values) {
            addCriterion("degree in", values, "degree");
            return (Criteria) this;
        }

        public Criteria andDegreeNotIn(List<String> values) {
            addCriterion("degree not in", values, "degree");
            return (Criteria) this;
        }

        public Criteria andDegreeBetween(String value1, String value2) {
            addCriterion("degree between", value1, value2, "degree");
            return (Criteria) this;
        }

        public Criteria andDegreeNotBetween(String value1, String value2) {
            addCriterion("degree not between", value1, value2, "degree");
            return (Criteria) this;
        }

        public Criteria andPositionTemptationIsNull() {
            addCriterion("position_temptation is null");
            return (Criteria) this;
        }

        public Criteria andPositionTemptationIsNotNull() {
            addCriterion("position_temptation is not null");
            return (Criteria) this;
        }

        public Criteria andPositionTemptationEqualTo(String value) {
            addCriterion("position_temptation =", value, "positionTemptation");
            return (Criteria) this;
        }

        public Criteria andPositionTemptationNotEqualTo(String value) {
            addCriterion("position_temptation <>", value, "positionTemptation");
            return (Criteria) this;
        }

        public Criteria andPositionTemptationGreaterThan(String value) {
            addCriterion("position_temptation >", value, "positionTemptation");
            return (Criteria) this;
        }

        public Criteria andPositionTemptationGreaterThanOrEqualTo(String value) {
            addCriterion("position_temptation >=", value, "positionTemptation");
            return (Criteria) this;
        }

        public Criteria andPositionTemptationLessThan(String value) {
            addCriterion("position_temptation <", value, "positionTemptation");
            return (Criteria) this;
        }

        public Criteria andPositionTemptationLessThanOrEqualTo(String value) {
            addCriterion("position_temptation <=", value, "positionTemptation");
            return (Criteria) this;
        }

        public Criteria andPositionTemptationLike(String value) {
            addCriterion("position_temptation like", value, "positionTemptation");
            return (Criteria) this;
        }

        public Criteria andPositionTemptationNotLike(String value) {
            addCriterion("position_temptation not like", value, "positionTemptation");
            return (Criteria) this;
        }

        public Criteria andPositionTemptationIn(List<String> values) {
            addCriterion("position_temptation in", values, "positionTemptation");
            return (Criteria) this;
        }

        public Criteria andPositionTemptationNotIn(List<String> values) {
            addCriterion("position_temptation not in", values, "positionTemptation");
            return (Criteria) this;
        }

        public Criteria andPositionTemptationBetween(String value1, String value2) {
            addCriterion("position_temptation between", value1, value2, "positionTemptation");
            return (Criteria) this;
        }

        public Criteria andPositionTemptationNotBetween(String value1, String value2) {
            addCriterion("position_temptation not between", value1, value2, "positionTemptation");
            return (Criteria) this;
        }

        public Criteria andPositionRequirementIsNull() {
            addCriterion("position_requirement is null");
            return (Criteria) this;
        }

        public Criteria andPositionRequirementIsNotNull() {
            addCriterion("position_requirement is not null");
            return (Criteria) this;
        }

        public Criteria andPositionRequirementEqualTo(String value) {
            addCriterion("position_requirement =", value, "positionRequirement");
            return (Criteria) this;
        }

        public Criteria andPositionRequirementNotEqualTo(String value) {
            addCriterion("position_requirement <>", value, "positionRequirement");
            return (Criteria) this;
        }

        public Criteria andPositionRequirementGreaterThan(String value) {
            addCriterion("position_requirement >", value, "positionRequirement");
            return (Criteria) this;
        }

        public Criteria andPositionRequirementGreaterThanOrEqualTo(String value) {
            addCriterion("position_requirement >=", value, "positionRequirement");
            return (Criteria) this;
        }

        public Criteria andPositionRequirementLessThan(String value) {
            addCriterion("position_requirement <", value, "positionRequirement");
            return (Criteria) this;
        }

        public Criteria andPositionRequirementLessThanOrEqualTo(String value) {
            addCriterion("position_requirement <=", value, "positionRequirement");
            return (Criteria) this;
        }

        public Criteria andPositionRequirementLike(String value) {
            addCriterion("position_requirement like", value, "positionRequirement");
            return (Criteria) this;
        }

        public Criteria andPositionRequirementNotLike(String value) {
            addCriterion("position_requirement not like", value, "positionRequirement");
            return (Criteria) this;
        }

        public Criteria andPositionRequirementIn(List<String> values) {
            addCriterion("position_requirement in", values, "positionRequirement");
            return (Criteria) this;
        }

        public Criteria andPositionRequirementNotIn(List<String> values) {
            addCriterion("position_requirement not in", values, "positionRequirement");
            return (Criteria) this;
        }

        public Criteria andPositionRequirementBetween(String value1, String value2) {
            addCriterion("position_requirement between", value1, value2, "positionRequirement");
            return (Criteria) this;
        }

        public Criteria andPositionRequirementNotBetween(String value1, String value2) {
            addCriterion("position_requirement not between", value1, value2, "positionRequirement");
            return (Criteria) this;
        }

        public Criteria andJobAddrIsNull() {
            addCriterion("job_addr is null");
            return (Criteria) this;
        }

        public Criteria andJobAddrIsNotNull() {
            addCriterion("job_addr is not null");
            return (Criteria) this;
        }

        public Criteria andJobAddrEqualTo(String value) {
            addCriterion("job_addr =", value, "jobAddr");
            return (Criteria) this;
        }

        public Criteria andJobAddrNotEqualTo(String value) {
            addCriterion("job_addr <>", value, "jobAddr");
            return (Criteria) this;
        }

        public Criteria andJobAddrGreaterThan(String value) {
            addCriterion("job_addr >", value, "jobAddr");
            return (Criteria) this;
        }

        public Criteria andJobAddrGreaterThanOrEqualTo(String value) {
            addCriterion("job_addr >=", value, "jobAddr");
            return (Criteria) this;
        }

        public Criteria andJobAddrLessThan(String value) {
            addCriterion("job_addr <", value, "jobAddr");
            return (Criteria) this;
        }

        public Criteria andJobAddrLessThanOrEqualTo(String value) {
            addCriterion("job_addr <=", value, "jobAddr");
            return (Criteria) this;
        }

        public Criteria andJobAddrLike(String value) {
            addCriterion("job_addr like", value, "jobAddr");
            return (Criteria) this;
        }

        public Criteria andJobAddrNotLike(String value) {
            addCriterion("job_addr not like", value, "jobAddr");
            return (Criteria) this;
        }

        public Criteria andJobAddrIn(List<String> values) {
            addCriterion("job_addr in", values, "jobAddr");
            return (Criteria) this;
        }

        public Criteria andJobAddrNotIn(List<String> values) {
            addCriterion("job_addr not in", values, "jobAddr");
            return (Criteria) this;
        }

        public Criteria andJobAddrBetween(String value1, String value2) {
            addCriterion("job_addr between", value1, value2, "jobAddr");
            return (Criteria) this;
        }

        public Criteria andJobAddrNotBetween(String value1, String value2) {
            addCriterion("job_addr not between", value1, value2, "jobAddr");
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

        public Criteria andReleaseTimeIsNull() {
            addCriterion("release_time is null");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeIsNotNull() {
            addCriterion("release_time is not null");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeEqualTo(String value) {
            addCriterion("release_time =", value, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeNotEqualTo(String value) {
            addCriterion("release_time <>", value, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeGreaterThan(String value) {
            addCriterion("release_time >", value, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeGreaterThanOrEqualTo(String value) {
            addCriterion("release_time >=", value, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeLessThan(String value) {
            addCriterion("release_time <", value, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeLessThanOrEqualTo(String value) {
            addCriterion("release_time <=", value, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeLike(String value) {
            addCriterion("release_time like", value, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeNotLike(String value) {
            addCriterion("release_time not like", value, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeIn(List<String> values) {
            addCriterion("release_time in", values, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeNotIn(List<String> values) {
            addCriterion("release_time not in", values, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeBetween(String value1, String value2) {
            addCriterion("release_time between", value1, value2, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeNotBetween(String value1, String value2) {
            addCriterion("release_time not between", value1, value2, "releaseTime");
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