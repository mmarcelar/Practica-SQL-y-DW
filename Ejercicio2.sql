-- Crear la tabla Student
CREATE TABLE Student(
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
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

-- Crear la tabla Bootcamp
CREATE TABLE Bootcamp(
    bootcamp_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
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

-- Crear la tabla Filial
CREATE TABLE Filial(
    filial_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL   
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