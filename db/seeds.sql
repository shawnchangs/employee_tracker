-- Adding department data
INSERT INTO department(name)
VALUES ("Operations"), ("Finance"), ("Sales"), ("Legal"), ("Engineering");

-- Adding role data
INSERT INTO role(title, salary, department_id)
VALUES ("Operations Manager",120000, 1),
    ("Associate",75000, 1),
    ("Financial Analyst",125000, 2),
    ("Salesperson",90000, 3),
    ("Lawyer",180000, 4),
    ("Engineering Manager",135000, 5),
    ("Intern",85000, 5),
    ("Engineer",120000, 5);

-- Adding employee data
INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Bart", "Simpson", 1, null),
    ("Barney", "Gumble", 3, null),
    ("Ralph", "Wiggum", 5, 2),
    ("Edna", "Krabappel", 2, 3),
    ("Sideshow", "Bob", 3, 3),
    ("Groundskeeper", "Willie", 4, 3);

-- Adding views
CREATE VIEW employee_info AS
(SELECT
role.id AS role_id,
role.title,
role.salary,
department.name AS department_name
FROM role 
JOIN department 
on role.department_id = department.id);

CREATE VIEW employees_with_managers AS
(SELECT emp.id,
emp.first_name,
emp.last_name,
emp.role_id,
CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name
FROM employee AS manager RIGHT OUTER JOIN employee AS emp ON manager.id = emp.manager_id);