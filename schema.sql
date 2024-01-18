CREATE TABLE user_
(
  UserId SERIAL,
  Name VARCHAR(250) NOT NULL,
  Email VARCHAR(250) NOT NULL,
  Password VARCHAR(250) NOT NULL,
  MobileNumber VARCHAR(250) NOT NULL,
  Country VARCHAR(250) NOT NULL,
  City VARCHAR(250) NOT NULL ,
  Photo VARCHAR(250),
  CV VARCHAR(250),
  PRIMARY KEY (UserId),
  UNIQUE (Email),
  UNIQUE (MobileNumber)
);

CREATE TABLE CompanyCategory
(
  CategoryId INT NOT NULL ,
  CategoryName VARCHAR(250) NOT NULL ,
  PRIMARY KEY (CategoryId)
);


CREATE TABLE Company
(
  CompanyId SERIAL,
  CompanyName VARCHAR(250) NOT NULL,
  Company_size VARCHAR(250) NOT NULL ,
  CategoryID INT NOT NULL ,           
  CompanyCountry VARCHAR(250) NOT NULL,
  CompanyCity VARCHAR(250) NOT NULL ,
  CompanyEmail VARCHAR(250)  NOT NULL ,
  Password VARCHAR(250) NOT NULL,
  Logo VARCHAR(250),
  PRIMARY KEY (CompanyId),
  FOREIGN KEY (CategoryID) REFERENCES CompanyCategory(CategoryId),
  UNIQUE (CompanyEmail)
);

CREATE TABLE University
(
  UniversityId SERIAL,
  UniversityName VARCHAR(250) NOT NULL,
  Country VARCHAR(250) NOT NULL,
  City VARCHAR(250) NOT NULL ,
  ContactEmail VARCHAR(250) NOT NULL,
  UniversityEmail VARCHAR(250)  NOT NULL ,
  Password VARCHAR(250) NOT NULL,
  Logo VARCHAR(250),
  PRIMARY KEY (UniversityId),
  UNIQUE (ContactEmail),
  UNIQUE (UniversityEmail)

);

CREATE TABLE Job
(
  JobId SERIAL,
  JobTitle VARCHAR(250) NOT NULL,
  Country VARCHAR(250) NOT  NULL,
  City VARCHAR(250) NOT NULL ,
  Salary VARCHAR(250) ,
  JobDescription VARCHAR(250) NOT NULL,
  CompanyId INT NOT NULL,
  RequiredSkills VARCHAR(250),
  PRIMARY KEY (JobId),
  FOREIGN KEY (CompanyId) REFERENCES Company(CompanyId)
);

CREATE TABLE Internship
(
  InternshipId SERIAL,
  InternshipTitle VARCHAR(250) NOT NULL,
  Country VARCHAR(250) NOT  NULL,
  City VARCHAR(250) NOT NULL ,
  Salary VARCHAR(250)  ,
  CompanyId INT NOT NULL,
  RequiredSkills VARCHAR(250),
  PRIMARY KEY (InternshipId),
  FOREIGN KEY (CompanyId) REFERENCES Company(CompanyId)
);

CREATE TABLE Scholarship
(
  ScholarshipId SERIAL,
  FundingPercentage VARCHAR(250) NOT NULL,
  ScholarshipTitle VARCHAR(250) NOT NULL,
  Description VARCHAR(250) ,
  UniversityId INT NOT NULL,
  PRIMARY KEY (ScholarshipId),
  FOREIGN KEY (UniversityId) REFERENCES University(UniversityId)
);

CREATE TABLE JobApply
(
  ApplyDate DATE NOT NULL,
  UserId INT NOT NULL,
  JobId INT NOT NULL,    
  Skills VARCHAR(250) , 
  Experience VARCHAR(250) ,
  PRIMARY KEY (UserId, JobId),
  FOREIGN KEY (UserId) REFERENCES user_(UserId),
  FOREIGN KEY (JobId) REFERENCES Job(JobId)
);

CREATE TABLE ScholarshipApply
(
  ApplyDate DATE NOT NULL,
  UserId INT NOT NULL,
  ScholarshipId INT NOT NULL,
  Skills VARCHAR(250) , 
  PRIMARY KEY (UserId, ScholarshipId),
  FOREIGN KEY (UserId) REFERENCES user_(UserId),
  FOREIGN KEY (ScholarshipId) REFERENCES Scholarship(ScholarshipId)
);

CREATE TABLE InternshipApply
(
  ApplyDate DATE NOT NULL,
  UserId INT NOT NULL,
  InternshipId INT NOT NULL,
  Skills VARCHAR(250) ,
  PRIMARY KEY (UserId, InternshipId),
  FOREIGN KEY (UserId) REFERENCES user_(UserId),
  FOREIGN KEY (InternshipId) REFERENCES Internship(InternshipId)
);

