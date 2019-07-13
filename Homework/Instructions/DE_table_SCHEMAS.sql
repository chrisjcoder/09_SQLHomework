-- Table: public.departments

-- DROP TABLE public.departments;

CREATE TABLE public.departments
(
    dept_no character varying(50) COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT department_pkey PRIMARY KEY (dept_no),
    CONSTRAINT dept_no UNIQUE (dept_no)

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.departments
    OWNER to postgres;

-- Table: public.dept_emp

-- DROP TABLE public.dept_emp;

CREATE TABLE public.dept_emp
(
    emp_no bigint NOT NULL,
    dept_no character varying(50) COLLATE pg_catalog."default" NOT NULL,
    from_date date,
    to_date date,
    CONSTRAINT "PK_dept_empno_deptno" PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT "FK_dept_EMP_NO" FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE NO ACTION,
    CONSTRAINT "FK_dept_dept_no" FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.dept_emp
    OWNER to postgres;

	-- Table: public.dept_manager

-- DROP TABLE public.dept_manager;

CREATE TABLE public.dept_manager
(
    dept_no character varying(50) COLLATE pg_catalog."default" NOT NULL,
    emp_no bigint NOT NULL,
    from_date date,
    to_date date,
    CONSTRAINT "PK_dept_manager" PRIMARY KEY (dept_no, emp_no),
    CONSTRAINT "FK_dept_manager_dept_no" FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE NO ACTION,
    CONSTRAINT "FK_dept_manager_emp_no" FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.dept_manager
    OWNER to postgres;


	-- Table: public.employees

-- DROP TABLE public.employees;

CREATE TABLE public.employees
(
    emp_no bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    birth_date date,
    first_name character varying(50) COLLATE pg_catalog."default",
    last_name character varying(50) COLLATE pg_catalog."default",
    gender character varying(3) COLLATE pg_catalog."default" NOT NULL,
    hire_date date NOT NULL,
    CONSTRAINT employees_pkey PRIMARY KEY (emp_no),
    CONSTRAINT emp_no_unqiue UNIQUE (emp_no)

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.employees
    OWNER to postgres;



	-- Table: public.salaries

-- DROP TABLE public.salaries;

CREATE TABLE public.salaries
(
    emp_no bigint NOT NULL,
    salary numeric(12,2),
    from_date date,
    to_date date,
    CONSTRAINT "PK_salaries_emp_no" PRIMARY KEY (emp_no),
    CONSTRAINT "FK_salaries_employees_emp_no" FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.salaries
    OWNER to postgres;


	-- Table: public.titles

-- DROP TABLE public.titles;

CREATE TABLE public.titles
(
    emp_no bigint NOT NULL,
    title character varying(100) COLLATE pg_catalog."default" NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT "PK_titles" PRIMARY KEY (emp_no, title, from_date, to_date),
    CONSTRAINT "FK_titles_employee_emp_no" FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.titles
    OWNER to postgres;


