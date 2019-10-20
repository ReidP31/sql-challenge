﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/6mS6gQ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
https://app.quickdatabasediagrams.com/#/d/6mS6gQ

CREATE TABLE departments (
    dept_no VarChar   NOT NULL,
    dept_name VarChar   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    dept_no VarChar   NOT NULL,
    from_date VarChar   NOT NULL,
    to_date VarChar   NOT NULL
);

CREATE TABLE dept_manager (
    dept_no VarChar   NOT NULL,
    emp_no int   NOT NULL,
    from_date VarChar   NOT NULL,
    to_date VarChar   NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE employees (
    emp_no int   NOT NULL,
    birth_date VarChar   NOT NULL,
    first_name VarChar   NOT NULL,
    last_name VarChar   NOT NULL,
    gender VarChar   NOT NULL,
    hire_date VarChar   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    from_date VarChar   NOT NULL,
    to_date VarChar   NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE titles (
    emp_no int   NOT NULL,
    title VarChar   NOT NULL,
    from_date VarChar   NOT NULL,
    to_date VarChar   NOT NULL
);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE titles ADD CONSTRAINT fk_titles_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

