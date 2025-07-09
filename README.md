## 📌 Oracle SQL Examples (EMP, DEPT)

### 1️⃣ 급여에 따라 등급 나누어 조회하기

* 3000 이상: `A`
* 2000 이상: `B`
* 1000 이상: `C`
* 1000 미만: `D`

```sql
SELECT 
    ename,
    CASE
        WHEN sal >= 3000 THEN 'A'
        WHEN sal >= 2000 THEN 'B'
        WHEN sal >= 1000 THEN 'C'
        ELSE 'D'
    END AS 급여등급
FROM emp;
```
---

### 2️⃣ 본인과 상사 이름 찾기

```sql
SELECT 
    e.ename AS "사원 이름", 
    g.ename AS "상사 이름"
FROM emp e
JOIN emp g
    ON e.mgr = g.empno;
```

---

### 3️⃣ 부서별 평균 연봉 조회

```sql
SELECT 
    d.dname AS "부서명", 
    ROUND(AVG(e.sal) * 12, 2) AS "평균 연봉"
FROM emp e
JOIN dept d
    ON e.deptno = d.deptno
GROUP BY d.dname;
```

---

### 4️⃣ 입사 연도별 평균 연봉 조회

```sql
SELECT 
    TO_CHAR(hiredate, 'YYYY') AS "입사 연도",
    ROUND(AVG(sal) * 12, 2) AS "평균 연봉"
FROM emp
GROUP BY TO_CHAR(hiredate, 'YYYY')
ORDER BY "입사 연도";
```

---

### 5️⃣ EMP와 DEPT 테이블 전체 조인 조회

```sql
SELECT *
FROM emp e
JOIN dept d
    ON e.deptno = d.deptno;
```
