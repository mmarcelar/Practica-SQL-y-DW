drop table if EXISTS note_student_module;
drop table if EXISTS bootcamp_student;
drop table if EXISTS module_teacher;
drop table if EXISTS note;
drop table if EXISTS student;
drop table if EXISTS bootcamp;
drop table if EXISTS teacher;
drop table if EXISTS filial;
drop table if EXISTS module;

-- Crear la tabla Student
CREATE TABLE Student(
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

-- Crear la tabla Teacher
CREATE TABLE Teacher(
    teacher_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

-- Crear la tabla Filial
CREATE TABLE Filial(
    filial_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL, 
    address VARCHAR(50) NOT NULL
);

-- Crear la tabla Bootcamp
CREATE TABLE Bootcamp(
    bootcamp_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    filial_id INT,
    num_edicion VARCHAR(20) NOT NULL,
    name_director VARCHAR(50) NOT NULL,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (filial_id) REFERENCES FILIAL(filial_id) 
);

-- Crear la tabla Module
CREATE TABLE Module(
    module_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL, 
    hours INT
);

-- Crear la tabla Note
CREATE TABLE Note(
    note_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL   
);

-- Crear la tabla Bootcamp - Student
CREATE TABLE Bootcamp_Student(
    boot_student_id SERIAL PRIMARY KEY,
    student_id INT,
    bootcamp_id INT,
    FOREIGN KEY (bootcamp_id) REFERENCES BOOTCAMP(bootcamp_id),
    FOREIGN KEY (student_id) REFERENCES STUDENT(student_id)
);

-- Crear la tabla Note - Student - Module
CREATE TABLE Note_Student_Module(
    note_student_module_id SERIAL PRIMARY KEY,
    student_id INT,
    note_id INT,
    module_id INT,
    FOREIGN KEY (note_id) REFERENCES NOTE(note_id),
    FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
    FOREIGN KEY (module_id) REFERENCES MODULE(module_id)
);

-- Crear la tabla Module - Teacher
CREATE TABLE Module_Teacher(
    module_teacher_id SERIAL PRIMARY KEY,
    teacher_id INT,
    module_id INT,
    FOREIGN KEY (module_id) REFERENCES MODULE(module_id),
    FOREIGN KEY (teacher_id) REFERENCES TEACHER(teacher_id)
);

INSERT INTO Student (name, surname, email, phone, address, city, country) VALUES
('Ana', 'González', 'ana.gonzalez@email.com', '912-222333','Avenida Argentina 3835','Madrid','Spain'),
('Juan', 'Martínez', 'juan.martinez@email.com', '944-555666','Los Arces 1500','Barcelona','Spain'),
('Laura', 'Hernández', 'laura.hernandez@email.com', '977-888999','Sarmiento 569','Alicante','Spain'),
('Pedro', 'López', 'pedro.lopez@email.com', '910-112131','Av. Fuente 3981','Malaga','Spain'),
('María', 'Rodríguez', 'maria.rodriguez@email.com', '915-161718','El Comandante 45','Bogota','Colombia');

INSERT INTO teacher ( name, surname, email, phone, address, city, country) VALUES
('Javier', 'Sánchez', 'javier.sanchez@email.com', '919-021222','Luis Conde 298','Maracaibo','Colombia'),
('Carmen', 'Pérez', 'carmen.perez@email.com', '924-252627', 'El Paraiso 90','Bogota','Colombia'),
('Antonio', 'García', 'antonio.garcia@email.com', '928-293031',  'Los Robles 872','Madrid','Spain'),
('Isabel', 'Fernández', 'isabel.fernandez@email.com', '932-333435', 'Bouchard 6521','Madrid','Spain'),
('Sergio', 'Martín', 'sergio.martin@email.com', '936-373839','Av. La Casona 9824','Madrid','Spain');

INSERT INTO Filial (name, address, city, country)
VALUES
  ('Sede Central','C/ Méndez Álvaro 20','Madrid','Spain'),
  ('Sede Bogota','San Martin 7437','Bogota','Spain');

INSERT INTO Bootcamp (name, filial_id, num_edicion, name_director, start_date, end_date)
VALUES
  ('Big Data, Inteligencia Artificial & Machine Learning Full Stack', 1 ,'XIV','Sandra Sanchez', DATE '2024/03/01', DATE '2025/03/31'),
  ('Java Full Stack', '1','14','Pablo Granados', DATE '2024/03/01', DATE '2025/03/31'),
  ('Blockchain Full Stack', '1','14','Ramon Maldonado',  DATE '2024/03/01', DATE '2025/03/31'),
  ('Ciberseguridad Full Stack', '1','14','Natalia Zabala',  DATE '2024/03/01', DATE '2025/03/31'),
  ('Desarrollo de App Moviles Full Stack', '1','14','Luis Ventura', DATE '2024/03/01', DATE '2025/03/31'),
  ('Desarrollo Web Full Stack', '1','14','Gabriel Marquez',  DATE '2024/03/01', DATE '2025/03/31'),
  ('DevOps & Cloud Computing Full Stack', '1','14','Marcelo Moreno', DATE '2024/03/01', DATE '2025/03/31'),
  ('Diseno UX/UI AI Driven Full Stack', '1','14','Ignacio Fuentes',  DATE '2024/03/01', DATE '2025/03/31'),
  ('Inteligencia Artificial Full Stack', '1','14','Juan Perez', DATE '2024/03/01', DATE '2025/03/31'),
  ('AI Driven Digital Full Stack', '1','14','Cintia Ramirez',  DATE '2024/03/01', DATE '2025/03/31');

INSERT INTO note ( name)
VALUES
  ('Apto'),
  ('No Apto');
 
INSERT INTO Module (name, hours)
VALUES
 ('SQL, ETL & DW','12'),
 ('Java Script','12'),
 ('Phyton','12'),
 ('Matematicas','12'),
 ('Dockers','12'),
 ('Prompt Engineer','12'),
 ('iOS avanzado','12'),
 ('Inteligencia Artificial','12'),
 ('Git Hub & Git','12'),
 ('Exploración y visualización de datos','12'),
 ('Arquitectura','12'),
 ('Data Processing','12'),
 ('Machine Learning','12'),
 ('Scrach & Scala','12'),
 ('APP Moviles','12'),
 ('apps iOS con Swift','12'),
 ('Pentesting','12'),
 ('Desarrollo Web con HTML5 y CSS','12'),
 ('Diseño de experiencia de usuario','12'),
 ('Java avanzado con Spring Boot','12');

INSERT INTO Bootcamp_Student (student_id,bootcamp_id)
VALUES
  (1,10),
  (2,9),
  (3,8),
  (4,1),
  (5,2);

INSERT INTO Module_Teacher (teacher_id,module_id)
VALUES
  (1,1),
  (2,2),
  (3,3),
  (4,4),
  (5,5);

INSERT INTO Note_Student_Module (student_id,module_id, note_id)
VALUES
  (1,10,1),
  (2,9,2),
  (3,8,1),
  (4,1,2),
  (5,2,1);