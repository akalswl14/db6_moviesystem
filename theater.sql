DROP DATABASE IF EXISTS theater;
CREATE DATABASE theater;
use theater;

DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Holiday;
DROP TABLE IF EXISTS Commute;
DROP TABLE IF EXISTS Monthly_work;
DROP TABLE IF EXISTS Monthly_Salary;
DROP TABLE IF EXISTS SaleRecords_Snackbar;
DROP TABLE IF EXISTS Delivery;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS OrderReturnRequest;
DROP TABLE IF EXISTS Product_Snackbar;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS EachFacility;
DROP TABLE IF EXISTS Discard;
DROP TABLE IF EXISTS FacilityRepair;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS ScreeningMovie;
DROP TABLE IF EXISTS Seat_ScreeningNumber;
DROP TABLE IF EXISTS NonMemberInfo;
DROP TABLE IF EXISTS ReserveSeatInfo;
DROP TABLE IF EXISTS ReservationInfo;
DROP TABLE IF EXISTS PaymentInfo;
DROP TABLE IF EXISTS MemberInfo;
DROP TABLE IF EXISTS Reservation_Member;
DROP TABLE IF EXISTS MovieBranch;

CREATE TABLE Staff (
	EmployeeID 	integer	 NOT  NULL,      
	PW	         varchar(20)	 NULL,
	Name	         varchar(50)	 NULL,
	Birthday	     date	 NULL,
	Sex	         varchar(5)	 NULL,
	Position	     varchar(50)	 NULL,
	Phonenumber	 varchar(100)	 NULL,
	Address	     varchar(225)	 NULL,
	Team	         varchar(50)	 NULL,
	JoinDate	     date	 NULL,
	HolidayNumber	 integer	 NULL,
	Department	 varchar(50)	 NULL,
	AccountNumber 	 varchar(50)	 NULL,
	Bank	         varchar(20)	 NULL,
	Salary	     integer 	NULL,
	Branch	     Varchar(50)	 NOT  NULL,              
    
    CONSTRAINT  PK_Staff  PRIMARY KEY(EmployeeID)
);

CREATE TABLE Holiday (
	StartDate date NOT NULL,          
	EndDate date NOT NULL,           
	EmployeeID integer NOT NULL,       
	Type varchar(20) NULL,
	yearmonth varchar(10) NOT NULL,      

    CONSTRAINT  PK_Holiday  PRIMARY KEY(StartDate, EndDate, EmployeeID)
);

CREATE TABLE Commute (
	Date	        date	 NOT  NULL,              
	Time	        integer	 NOT  NULL,             
	EmployeeID	 integer 	NOT  NULL,             
	BarcodeNumber	 varchar(20)	 NULL,
	yearmonth 	varchar(10)	 NOT  NULL,           
    
    CONSTRAINT PK_Commute PRIMARY KEY (Date, Time, EmployeeID)
);

CREATE TABLE Monthly_work (
	yearmonth	     varchar(10)	 NOT  NULL,  
	EmployeeID	     integer	 NOT  NULL,       
	GeneralWorkHours	 integer 	NULL,
	Late	             integer 	NULL,
	UseHoliday	     integer	 NULL,
	OverworkHours  	integer	 NULL,
    
    CONSTRAINT PK_Monthly_work PRIMARY KEY (yearmonth, EmployeeID)
);

CREATE TABLE Monthly_Salary (
	EmployeeID	     integer	 NOT  NULL,       
	yearmonth	     varchar(10)	 NOT  NULL,   
	GeneralworkSalary	 integer 	NULL,
	OverworkSalary 	integer	  NULL,
	ExtraPay	         integer 	NULL,
	PaymentStatus	     boolean	 NULL,
    
    CONSTRAINT PK_Monthly_Salary  PRIMARY KEY (EmployeeID, yearmonth)
);

CREATE TABLE SaleRecords_Snackbar (
	Date date NOT NULL,      
	ProductNumber varchar(50) NOT NULL,
	Sale integer NOT NULL,
	Exchange integer NOT NULL,
	Refund integer NOT NULL,
    
    CONSTRAINT PK_SaleRecords_Snackbar PRIMARY KEY (Date, ProductNumber)
);

CREATE TABLE Delivery (
	OrderNumber varchar(50) NOT NULL,   
	DeliveryNumber varchar(50) NULL,
	ExceptDate date NULL,

    CONSTRAINT PK_Delivery  PRIMARY KEY (OrderNumber)
);

CREATE TABLE Department (
	DepartmentNumber integer NOT NULL,  
	Name varchar(50) NULL,
	Branch Varchar(50) NOT NULL,           

    CONSTRAINT PK_Department PRIMARY KEY (DepartmentNumber)
);

CREATE TABLE OrderReturnRequest (
	OrderNumber varchar(50) NOT NULL,   
	Date date NULL,
	OrderAmount integer NULL,
	ReturnAmount integer NULL,
	TotalPrice integer NOT NULL,
	ProductNumber varchar(50) NOT NULL,              
	DepartmentNumber integer NOT NULL,                  
	EachNumber integer NOT NULL,                   

    CONSTRAINT PK_OrderReturnRequest PRIMARY KEY (OrderNumber)
);

CREATE TABLE Product_Snackbar (
	ProductNumber varchar(50) NOT NULL,  
	Name varchar(50) NULL,
	Stock integer NULL,
	Price integer NULL,
	Branch Varchar(50) NOT NULL,               

    CONSTRAINT PK_Product_Snackbar PRIMARY KEY (ProductNumber)
);

CREATE TABLE Product (
	ProductNumber varchar(50) NOT NULL,  
	Name varchar(50) NULL,
	Price integer NULL,
	Category varchar(20) NULL,

    CONSTRAINT PK_Product PRIMARY KEY (ProductNumber)
);

CREATE TABLE Location (
	LocationNumber integer NOT NULL,
	Name varchar(30) NULL,
	Branch Varchar(50) NOT NULL,            

	CONSTRAINT PK_Location PRIMARY KEY (LocationNumber)
);

CREATE TABLE EachFacility (
	EachNumber integer NOT NULL,      
	ProductNumber varchar(50) NOT NULL,  
	Status varchar(50) NULL,
	BuyDate date NULL,
	LocationNumber integer NOT NULL,        
    
    CONSTRAINT PK_EachFacility PRIMARY KEY (EachNumber, ProductNumber)
);

CREATE TABLE Discard (
	EachNumber integer NOT NULL,      
	ProductNumber varchar(50) NOT NULL,   
	RequestDate date NULL,
	DiscardType varchar(255) NULL,
	LocationNumber integer 	NULL,
	Status varchar(20) NULL,
	DiscardDate date NULL,
	Branch Varchar(50) NOT NULL,       
    
    CONSTRAINT PK_Discard PRIMARY KEY (EachNumber, ProductNumber)
);

CREATE TABLE FacilityRepair (
	DepartNumber integer NOT NULL,       
	EachNumber integer NOT NULL,
	ProductNumber varchar(50) NOT NULL,
	RequestDate date NOT NULL,
	Detail varchar(255) NULL,

    CONSTRAINT PK_FacilityRepair PRIMARY KEY (DepartNumber, EachNumber, ProductNumber)
);

CREATE TABLE Movie (
	MovieCode integer 	NOT  NULL,          
	Name varchar(50) 	NULL,
	Rate float(2,1) 	NULL,
	Genre varchar(8)	 NULL,
	BookingRate float(3,1)	 NULL,
	Type integer	 NULL,
	ReleaseDate date	 NULL,
	RunningTime time	 NULL,
	Cast varchar(255)	 NULL,
	TotalAttendance integer NULL,
	AgeLimit varchar(10) NULL,
	Poster varchar(50) NULL,
	Story text NULL,
	ScreenType integer NULL,
	Director varchar(50) NULL,

    CONSTRAINT PK_Movie PRIMARY KEY (MovieCode)
);

CREATE TABLE ScreeningMovie (
	ScreeningNumber integer NOT NULL,
	StartTime datetime NOT NULL,
	EndTime datetime NOT NULL,
	Date date NOT NULL,
	TotalSeat integer NOT NULL,
	ReservedSeat integer NULL,
	ScreeningSpace varchar(8) NULL,
	MovieCode integer NOT NULL,               
	Branch Varchar(50) NOT  NULL,           

    CONSTRAINT PK_ScreeningMovie PRIMARY KEY (ScreeningNumber)
);

CREATE TABLE Seat_ScreeningNumber (
	SeatNumber varchar(8) NOT NULL,      
	ReserveStatus boolean NULL,
	ScreeningNumber integer NOT NULL,                       

    CONSTRAINT PK_Seat_ScreeningNumber PRIMARY KEY (SeatNumber)
);

CREATE TABLE NonMemberInfo (
	ReserveNumber varchar(50) NOT NULL,   
	Name varchar(50) NULL,
	PW varchar(128) NULL,
	Birthday date NULL,
	PhoneNumber varchar(100) NULL,

    CONSTRAINT PK_NonMemberInfo PRIMARY KEY (ReserveNumber)
);

CREATE TABLE ReserveSeatInfo (
	SeatNumber varchar(8) NOT NULL,      
	PeopleType varchar(8) NULL,
	ReserveNumber varchar(50) NOT NULL,                   

    CONSTRAINT PK_ReserveSeatInfo PRIMARY KEY (SeatNumber)
);

CREATE TABLE ReservationInfo (
	ReserveNumber Varchar(50) NOT NULL,   
	MemberStatus boolean NULL,
	PaymentNumber varchar(20) NULL,
	ReserveDate date NOT NULL,
	ReservePlace varchar(8) NOT NULL,
	TicketIssueStatus boolean NOT NULL,
	ReserveCancel integer NULL,
	ScreeningNumber integer NOT NULL,   

    CONSTRAINT PK_ReservationInfo PRIMARY KEY (ReserveNumber)
);

CREATE TABLE PaymentInfo (
	PaymentNumber Varchar(50) NOT NULL,   
	PaymentMethod varchar(50) NOT NULL,  
	Amount integer NULL,
	ReserveNumber Varchar(50) NOT NULL,    
    
    CONSTRAINT PK_PaymentInfo PRIMARY KEY (PaymentNumber, PaymentMethod)
);

CREATE TABLE MemberInfo (
	ID varchar(50) NOT NULL,           
	PW varchar(128) NULL,
	Name varchar(50) NULL,
	PhoneNumber varchar(100) NULL,
	Birthday date NULL,
	Point integer NULL,
	AccumulatedPoint integer NULL,

    CONSTRAINT PK_MemberInfo PRIMARY KEY (ID)
);

CREATE TABLE Reservation_Member (
	ReserveNumber varchar(50) NOT NULL,     
	ID varchar(50) NOT NULL,                   

    CONSTRAINT PK_Reservation_Member PRIMARY KEY (ReserveNumber)
);

CREATE TABLE MovieBranch (
	Branch varchar(50) NOT NULL,     
	Name varchar(50) NULL,
	EachNumber integer NOT NULL,                     
	ProductNumber varchar(50) NOT NULL,                 

    CONSTRAINT PK_MovieBranch PRIMARY KEY (Branch)
);

ALTER TABLE Staff ADD CONSTRAINT FK_MovieBranch_TO_Staff_1 FOREIGN KEY (
	Branch
)
REFERENCES MovieBranch (
	Branch
);

ALTER TABLE Holiday ADD CONSTRAINT FK_Staff_TO_Holiday_1 FOREIGN KEY (
	EmployeeID
)
REFERENCES Staff (
	EmployeeID
);

ALTER TABLE Holiday ADD CONSTRAINT FK_Monthly_work_TO_Holiday_1 FOREIGN KEY (
	yearmonth
)
REFERENCES Monthly_work (
	yearmonth
);

ALTER TABLE Commute ADD CONSTRAINT FK_Staff_TO_Commute_1 FOREIGN KEY (
	EmployeeID
)
REFERENCES Staff (
	EmployeeID
);

ALTER TABLE Commute ADD CONSTRAINT FK_Monthly_work_TO_Commute_1 FOREIGN KEY (
	yearmonth
)
REFERENCES Monthly_work (
	yearmonth
);

ALTER TABLE Monthly_work ADD CONSTRAINT FK_Staff_TO_Monthly_work_1 FOREIGN KEY (
	EmployeeID
)
REFERENCES Staff (
	EmployeeID
);

ALTER TABLE Monthly_Salary ADD CONSTRAINT FK_Staff_TO_Monthly_Salary_1 FOREIGN KEY (
	EmployeeID
)
REFERENCES Staff (
	EmployeeID
);

ALTER TABLE Monthly_Salary ADD CONSTRAINT FK_Monthly_work_TO_Monthly_Salary_1 FOREIGN KEY (
	yearmonth
)
REFERENCES Monthly_work (
	yearmonth
);

ALTER TABLE SaleRecords_Snackbar ADD CONSTRAINT FK_Product_Snackbar_TO_SaleRecords_Snackbar_1 FOREIGN KEY (
	ProductNumber
)
REFERENCES Product_Snackbar (
	ProductNumber
);

ALTER TABLE Department ADD CONSTRAINT FK_MovieBranch_TO_Department_1 FOREIGN KEY (
	Branch
)
REFERENCES MovieBranch (
	Branch
);

ALTER TABLE OrderReturnRequest ADD CONSTRAINT FK_Delivery_TO_OrderReturnRequest_1 FOREIGN KEY (
	OrderNumber
)
REFERENCES Delivery (
	OrderNumber
);

ALTER TABLE OrderReturnRequest ADD CONSTRAINT FK_Product_Snackbar_TO_OrderReturnRequest_1 FOREIGN KEY (
	ProductNumber
)
REFERENCES Product_Snackbar (
	ProductNumber
);

ALTER TABLE OrderReturnRequest ADD CONSTRAINT FK_Department_TO_OrderReturnRequest_1 FOREIGN KEY (
	DepartmentNumber
)
REFERENCES Department (
	DepartmentNumber
);

ALTER TABLE OrderReturnRequest ADD CONSTRAINT FK_EachFacility_TO_OrderReturnRequest_1 FOREIGN KEY (
	EachNumber
)
REFERENCES EachFacility (
	EachNumber
);

ALTER TABLE Product_Snackbar ADD CONSTRAINT FK_MovieBranch_TO_Product_Snackbar_1 FOREIGN KEY (
	Branch
)
REFERENCES MovieBranch (
	Branch
);

ALTER TABLE Location ADD CONSTRAINT FK_MovieBranch_TO_Location_1 FOREIGN KEY (
	Branch
)
REFERENCES MovieBranch (
	Branch
);

ALTER TABLE EachFacility ADD CONSTRAINT FK_Product_TO_EachFacility_1 FOREIGN KEY (
	ProductNumber
)
REFERENCES Product (
	ProductNumber
);

ALTER TABLE EachFacility ADD CONSTRAINT FK_Location_TO_EachFacility_1 FOREIGN KEY (
	LocationNumber
)
REFERENCES Location (
	LocationNumber
);

ALTER TABLE Discard ADD CONSTRAINT FK_EachFacility_TO_Discard_1 FOREIGN KEY (
	EachNumber
)
REFERENCES EachFacility (
	EachNumber
);

ALTER TABLE Discard ADD CONSTRAINT FK_EachFacility_TO_Discard_2 FOREIGN KEY (
	ProductNumber
)
REFERENCES EachFacility (
	ProductNumber
);

ALTER TABLE Discard ADD CONSTRAINT FK_MovieBranch_TO_Discard_1 FOREIGN KEY (
	Branch
)
REFERENCES MovieBranch (
	Branch
);

ALTER TABLE FacilityRepair ADD CONSTRAINT FK_EachFacility_TO_FacilityRepair_1 FOREIGN KEY (
	EachNumber
)
REFERENCES EachFacility (
	EachNumber
);

ALTER TABLE FacilityRepair ADD CONSTRAINT FK_EachFacility_TO_FacilityRepair_2 FOREIGN KEY (
	ProductNumber
)
REFERENCES EachFacility (
	ProductNumber
);

ALTER TABLE ScreeningMovie ADD CONSTRAINT FK_Movie_TO_ScreeningMovie_1 FOREIGN KEY (
	MovieCode
)
REFERENCES Movie (
	MovieCode
);

ALTER TABLE ScreeningMovie ADD CONSTRAINT FK_MovieBranch_TO_ScreeningMovie_1 FOREIGN KEY (
	Branch
)
REFERENCES MovieBranch (
	Branch
);

ALTER TABLE Seat_ScreeningNumber ADD CONSTRAINT FK_ScreeningMovie_TO_Seat_ScreeningNumber_1 FOREIGN KEY (
	ScreeningNumber
)
REFERENCES ScreeningMovie (
	ScreeningNumber
);

ALTER TABLE NonMemberInfo ADD CONSTRAINT FK_ReservationInfo_TO_NonMemberInfo_1 FOREIGN KEY (
	ReserveNumber
)
REFERENCES ReservationInfo (
	ReserveNumber
);

ALTER TABLE ReserveSeatInfo ADD CONSTRAINT FK_Seat_ScreeningNumber_TO_ReserveSeatInfo_1 FOREIGN KEY (
	SeatNumber
)
REFERENCES Seat_ScreeningNumber (
	SeatNumber
);

ALTER TABLE ReserveSeatInfo ADD CONSTRAINT FK_ReservationInfo_TO_ReserveSeatInfo_1 FOREIGN KEY (
	ReserveNumber
)
REFERENCES ReservationInfo (
	ReserveNumber
);

ALTER TABLE ReservationInfo ADD CONSTRAINT FK_ScreeningMovie_TO_ReservationInfo_1 FOREIGN KEY (
	ScreeningNumber
)
REFERENCES ScreeningMovie (
	ScreeningNumber
);

ALTER TABLE PaymentInfo ADD CONSTRAINT FK_ReservationInfo_TO_PaymentInfo_1 FOREIGN KEY (
	ReserveNumber
)
REFERENCES ReservationInfo (
	ReserveNumber
);

ALTER TABLE Reservation_Member ADD CONSTRAINT FK_ReservationInfo_TO_Reservation_Member_1 FOREIGN KEY (
	ReserveNumber
)
REFERENCES ReservationInfo (
	ReserveNumber
);

ALTER TABLE Reservation_Member ADD CONSTRAINT FK_MemberInfo_TO_Reservation_Member_1 FOREIGN KEY (
	ID
)
REFERENCES MemberInfo (
	ID
);

ALTER TABLE MovieBranch ADD CONSTRAINT FK_EachFacility_TO_MovieBranch_1 FOREIGN KEY (
	EachNumber
)
REFERENCES EachFacility (
	EachNumber
);

ALTER TABLE MovieBranch ADD CONSTRAINT FK_EachFacility_TO_MovieBranch_2 FOREIGN KEY (
	ProductNumber
)
REFERENCES EachFacility (
	ProductNumber
);
