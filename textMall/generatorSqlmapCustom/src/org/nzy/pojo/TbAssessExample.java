package org.nzy.pojo;

import java.util.ArrayList;
import java.util.List;

public class TbAssessExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TbAssessExample() {
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

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andItemidIsNull() {
            addCriterion("itemId is null");
            return (Criteria) this;
        }

        public Criteria andItemidIsNotNull() {
            addCriterion("itemId is not null");
            return (Criteria) this;
        }

        public Criteria andItemidEqualTo(String value) {
            addCriterion("itemId =", value, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidNotEqualTo(String value) {
            addCriterion("itemId <>", value, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidGreaterThan(String value) {
            addCriterion("itemId >", value, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidGreaterThanOrEqualTo(String value) {
            addCriterion("itemId >=", value, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidLessThan(String value) {
            addCriterion("itemId <", value, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidLessThanOrEqualTo(String value) {
            addCriterion("itemId <=", value, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidLike(String value) {
            addCriterion("itemId like", value, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidNotLike(String value) {
            addCriterion("itemId not like", value, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidIn(List<String> values) {
            addCriterion("itemId in", values, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidNotIn(List<String> values) {
            addCriterion("itemId not in", values, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidBetween(String value1, String value2) {
            addCriterion("itemId between", value1, value2, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidNotBetween(String value1, String value2) {
            addCriterion("itemId not between", value1, value2, "itemid");
            return (Criteria) this;
        }

        public Criteria andOrderidIsNull() {
            addCriterion("orderId is null");
            return (Criteria) this;
        }

        public Criteria andOrderidIsNotNull() {
            addCriterion("orderId is not null");
            return (Criteria) this;
        }

        public Criteria andOrderidEqualTo(String value) {
            addCriterion("orderId =", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotEqualTo(String value) {
            addCriterion("orderId <>", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidGreaterThan(String value) {
            addCriterion("orderId >", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidGreaterThanOrEqualTo(String value) {
            addCriterion("orderId >=", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidLessThan(String value) {
            addCriterion("orderId <", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidLessThanOrEqualTo(String value) {
            addCriterion("orderId <=", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidLike(String value) {
            addCriterion("orderId like", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotLike(String value) {
            addCriterion("orderId not like", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidIn(List<String> values) {
            addCriterion("orderId in", values, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotIn(List<String> values) {
            addCriterion("orderId not in", values, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidBetween(String value1, String value2) {
            addCriterion("orderId between", value1, value2, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotBetween(String value1, String value2) {
            addCriterion("orderId not between", value1, value2, "orderid");
            return (Criteria) this;
        }

        public Criteria andAssessIsNull() {
            addCriterion("assess is null");
            return (Criteria) this;
        }

        public Criteria andAssessIsNotNull() {
            addCriterion("assess is not null");
            return (Criteria) this;
        }

        public Criteria andAssessEqualTo(String value) {
            addCriterion("assess =", value, "assess");
            return (Criteria) this;
        }

        public Criteria andAssessNotEqualTo(String value) {
            addCriterion("assess <>", value, "assess");
            return (Criteria) this;
        }

        public Criteria andAssessGreaterThan(String value) {
            addCriterion("assess >", value, "assess");
            return (Criteria) this;
        }

        public Criteria andAssessGreaterThanOrEqualTo(String value) {
            addCriterion("assess >=", value, "assess");
            return (Criteria) this;
        }

        public Criteria andAssessLessThan(String value) {
            addCriterion("assess <", value, "assess");
            return (Criteria) this;
        }

        public Criteria andAssessLessThanOrEqualTo(String value) {
            addCriterion("assess <=", value, "assess");
            return (Criteria) this;
        }

        public Criteria andAssessLike(String value) {
            addCriterion("assess like", value, "assess");
            return (Criteria) this;
        }

        public Criteria andAssessNotLike(String value) {
            addCriterion("assess not like", value, "assess");
            return (Criteria) this;
        }

        public Criteria andAssessIn(List<String> values) {
            addCriterion("assess in", values, "assess");
            return (Criteria) this;
        }

        public Criteria andAssessNotIn(List<String> values) {
            addCriterion("assess not in", values, "assess");
            return (Criteria) this;
        }

        public Criteria andAssessBetween(String value1, String value2) {
            addCriterion("assess between", value1, value2, "assess");
            return (Criteria) this;
        }

        public Criteria andAssessNotBetween(String value1, String value2) {
            addCriterion("assess not between", value1, value2, "assess");
            return (Criteria) this;
        }

        public Criteria andStartIsNull() {
            addCriterion("start is null");
            return (Criteria) this;
        }

        public Criteria andStartIsNotNull() {
            addCriterion("start is not null");
            return (Criteria) this;
        }

        public Criteria andStartEqualTo(String value) {
            addCriterion("start =", value, "start");
            return (Criteria) this;
        }

        public Criteria andStartNotEqualTo(String value) {
            addCriterion("start <>", value, "start");
            return (Criteria) this;
        }

        public Criteria andStartGreaterThan(String value) {
            addCriterion("start >", value, "start");
            return (Criteria) this;
        }

        public Criteria andStartGreaterThanOrEqualTo(String value) {
            addCriterion("start >=", value, "start");
            return (Criteria) this;
        }

        public Criteria andStartLessThan(String value) {
            addCriterion("start <", value, "start");
            return (Criteria) this;
        }

        public Criteria andStartLessThanOrEqualTo(String value) {
            addCriterion("start <=", value, "start");
            return (Criteria) this;
        }

        public Criteria andStartLike(String value) {
            addCriterion("start like", value, "start");
            return (Criteria) this;
        }

        public Criteria andStartNotLike(String value) {
            addCriterion("start not like", value, "start");
            return (Criteria) this;
        }

        public Criteria andStartIn(List<String> values) {
            addCriterion("start in", values, "start");
            return (Criteria) this;
        }

        public Criteria andStartNotIn(List<String> values) {
            addCriterion("start not in", values, "start");
            return (Criteria) this;
        }

        public Criteria andStartBetween(String value1, String value2) {
            addCriterion("start between", value1, value2, "start");
            return (Criteria) this;
        }

        public Criteria andStartNotBetween(String value1, String value2) {
            addCriterion("start not between", value1, value2, "start");
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