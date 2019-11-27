DROP DATABASE IF EXISTS theater;
CREATE DATABASE theater;
use theater;

/* 중복 검사 */
DROP TABLE IF EXISTS 'Staff';
DROP TABLE IF EXISTS 'Holiday';
DROP TABLE IF EXISTS 'Commute';
DROP TABLE IF EXISTS 'Monthly_work';
DROP TABLE IF EXISTS 'Monthly_Salary';
DROP TABLE IF EXISTS 'SaleRecords_Snackbar';
DROP TABLE IF EXISTS 'Delivery';
DROP TABLE IF EXISTS 'Department';
DROP TABLE IF EXISTS 'OrderReturnRequest';
DROP TABLE IF EXISTS 'Product_Snackbar';
DROP TABLE IF EXISTS 'Product';
DROP TABLE IF EXISTS 'Location';
DROP TABLE IF EXISTS 'EachFacility';
DROP TABLE IF EXISTS 'Discard';
DROP TABLE IF EXISTS 'FacilityRepair';
DROP TABLE IF EXISTS 'Movie';
DROP TABLE IF EXISTS 'ScreeningMovie';
DROP TABLE IF EXISTS 'Seat_ScreeningNumber';
DROP TABLE IF EXISTS 'NonMemberInfo';
DROP TABLE IF EXISTS 'ReserveSeatInfo';
DROP TABLE IF EXISTS 'ReservationInfo';
DROP TABLE IF EXISTS 'PaymentInfo';
DROP TABLE IF EXISTS 'MemberInfo';
DROP TABLE IF EXISTS 'Reservation_Member';
DROP TABLE IF EXISTS 'MovieBranch';

CREATE TABLE `Staff` (
	`EmployeeID`	integer		NOT NULL,        /* PK */
	`PW`	        varchar(20)	NULL,
	`Name`	        varchar(50)	NULL,
	`Birthday`	date		NULL,
	`Sex`	        varchar(5)	NULL,
	`Position`	varchar(50)	NULL,
	`Phonenumber`	varchar(100)	NULL,
	`Address`	varchar(225)	NULL,
	`Team`	        varchar(50)	NULL,
	`JoinDate`	date		NULL,
	`HolidayNumber`	integer		NULL,
	`Department`	varchar(50)	NULL,
	`AccountNumber`	varchar(50)	NULL,
	`Bank`	        varchar(20)	NULL,
	`Salary`	integer		NULL,
	`Branch`	Varchar(50)	NOT NULL, 	/* FK MovieBranch FOREIGN KEY (Branch) REFERENCES MovieBranch (Branch) */
    
    CONSTRAINT PK_Staff PRIMARY KEY(EmployeeID)
);

CREATE TABLE `Holiday` (
	`StartDate`	date		NOT NULL,       /* PK */
	`EndDate`	date		NOT NULL,       /* PK */
	`EmployeeID`	integer		NOT NULL,       /* PK */ /* FK Staff */
	`Type`	        varchar(20)	NULL,
	`Year-Month`	varchar(10)	NOT NULL,   	/* FK Monthly_work */

    CONSTRAINT PK_Holiday PRIMARY KEY(StartDate, EndDate, EmployeeID)
);

CREATE TABLE `Commute` (
	`Date`	        date		NOT NULL,               /* PK */
	`Time`	        integer		NOT NULL,               /* PK */
	`EmployeeID`	integer		NOT NULL,               /* PK */ /* FK Staff */
	`BarcodeNumber`	varchar(20)	NULL,
	`Year-Month`	varchar(10)	NOT NULL,               /* FK Monthly_work */
    
    CONSTRAINT PK_Commute PRIMARY KEY (Date, Time, EmployeeID)
);

CREATE TABLE `Monthly_work` (
	`Year-Month`	   	varchar(10)	NOT NULL,   	/* PK */
	`EmployeeID`	    	integer		NOT NULL,       /* PK */ /* FK Staff */
	`GeneralWorkHours`	integer		NULL,
	`Late`	            	integer		NULL,
	`UseHoliday`	    	integer		NULL,
	`OverworkHours` 	integer		NULL,
    
    CONSTRAINT PK_Monthly_work PRIMARY KEY (Year-Month, EmployeeID)
);

CREATE TABLE `Monthly_Salary` (
	`EmployeeID`	    	integer		NOT NULL,       /* PK */ /* FK Staff */
	`Year-Month`	    	varchar(10)	NOT NULL,   	/* PK */ /* FK Monthly_work */
	`GeneralworkSalary`	integer		NULL,
	`OverworkSalary`	integer		NULL,
	`ExtraPay`	        integer		NULL,
	`PaymentStatus`	    	boolean		NULL,
    
    CONSTRAINT PK_Monthly_Salary PRIMARY KEY (EmployeeID, Year-Month)
);

CREATE TABLE `SaleRecords_Snackbar` (
	`Date`	        	date		NOT NULL,       /* PK */
	`ProductNumber`		varchar(50)	NOT NULL,   	/* PK */ /* FK Product_Snackbar */
	`Sale`	        	integer		NULL,
	`Exchange`	    	integer		NULL,
	`Refund`	    	integer		NULL,
    
    CONSTRAINT PK_SaleRecords_Snackbar PRIMARY KEY (Date, ProductNumber)
);

CREATE TABLE `Delivery` (
	`OrderNumber`	    	varchar(50) 	NOT NULL	auto_increment,   /* PK */
	`DeliveryNumber`	varchar(50)	NULL,
	`ExceptDate`	    	date		NULL,

    CONSTRAINT PK_Delivery PRIMARY KEY (OrderNumber)
);

CREATE TABLE `Department` (
	`DepartmentNumber`	integer 	NOT NULL,   	    /* PK */
	`Name`	            	varchar(50)	NULL,
	`Branch`	        Varchar(50)	NOT NULL            /* FK MovieBranch */

    CONSTRAINT PK_Department PRIMARY KEY (DepartmentNumber)
);

CREATE TABLE `OrderReturnRequest` (
	`OrderNumber`	    	varchar(50) 	NOT NULL			  /* PK */ /* FK Delivery */
	`Date`	           	date		NULL,
	`OrderAmount`	    	integer		NULL,
	`ReturnAmount`	    	integer		NULL,
	`TotalPrice`	    	integer		NULL,
	`ProductNumber`	    	varchar(50)	NOT NULL,   			  /* FK Product_Snackbar */
	`DepartmentNumber`	integer		NOT NULL,   			  /* FK Department */
	`EachNumber`	    	integer		NOT NULL,   			  /* FK EachFacility */

    CONSTRAINT PK_OrderReturnRequest PRIMARY KEY (OrderNumber)
);

CREATE TABLE `Product_Snackbar` (
	`ProductNumber`	varchar(50) 	NOT NULL,   /* PK */
	`Name`	        varchar(50)	NULL,
	`Stock`	        integer		NULL,
	`Price`	        integer		NULL,
	`Branch`	Varchar(50)	NOT NULL,   /* FK MovieBranch */

    CONSTRAINT PK_Product_Snackbar PRIMARY KEY (ProductNumber)
);

CREATE TABLE `Product` (
	`ProductNumber`	varchar(50) 	NOT NULL	auto_increment,   /* PK */
	`Name`	        varchar(50)	NULL,
	`Price`	        integer		NULL,
	`Category`	varchar(20)	NULL,

    CONSTRAINT PK_Product PRIMARY KEY (ProductNumber)
);

CREATE TABLE `Location` (
	`LocationNumber`	integer		NOT NULL	auto_increment,   /* PK */
	`Name`	            	varchar(30)	NULL,
	`Branch`	        Varchar(50)	NOT NULL,       		 /* FK MovieBranch */

    CONSTRAINT PK_Location PRIMARY KEY (LocationNumber)
);

CREATE TABLE `EachFacility` (
	`EachNumber`	    	integer		NOT NULL,       /* PK */
	`ProductNumber`	    	varchar(50)	NOT NULL,   	/* PK */ /* FK Product */
	`Status`	        varchar(50)	NULL,
	`BuyDate`	        date		NULL,
	`LocationNumber`	integer		NOT NULL,       /* FK Location */
    
    CONSTRAINT PK_EachFacility PRIMARY KEY (EachNumber, ProductNumber)
);

CREATE TABLE `Discard` (
	`EachNumber`	   	integer		NOT NULL,       /* PK */ /* FK EachFacility */
	`ProductNumber`	    	varchar(50)	NOT NULL,   	/* PK */ /* FK EachFacility */
	`RequestDate`	    	date		NULL,
	`DiscardType`	    	varchar(255)	NULL,
	`LocationNumber`	integer		NULL,
	`Status`	        varchar(20)	NULL,
	`DiscardDate`	    	date		NULL,
	`Branch`	        Varchar(50)	NOT NULL,        /* FK MoveiBranch */
    
    CONSTRAINT PK_Discard PRIMARY KEY (EachNumber, ProductNumber)
);

CREATE TABLE `FacilityRepair` (
	`DepartNumber`	integer		NOT NULL,       /* PK */
	`EachNumber`	integer		NOT NULL,       /* PK */ /* FK EachFacility */
	`ProductNumber`	varchar(50)	NOT NULL,   	/* PK */ /* FK EachFacility */
	`RequestDate`	date		NULL,
	`Detail`	varchar(255)	NULL,

    CONSTRAINT PK_FacilityRepair PRIMARY KEY (DepartNumber, EachNuber, ProductNumber)
);

CREATE TABLE `Movie` (
	`MovieCode`	        integer		NOT NULL	auto_increment,           /* PK */
	`Name`	            	varchar(50)	NULL,
	`Rate`	            	float		NULL,
	`Genre`	            	varchar(8)	NULL,
	`BookingRate`	    	float		NULL,
	`Type`	            	integer		NULL,
	`ReleaseDate`	    	date		NULL,
	`RunningTime`	   	time(8)		NULL,
	`Cast`	            	varchar(255)	NULL,
	`TotalAttendance`	integer		NULL,
	`AgeLimit`	        integer		NULL,
	`Poster`	        varchar(50)	NULL,
	`Story`	            	text		NULL,
	`ScreenType`	    	integer		NULL,
	`Director`	        varchar(50)	NULL,

    CONSTRAINT PK_Movie PRIMARY KEY (MovieCode)
);

CREATE TABLE `ScreeningMovie` (
	`ScreeningNumber`	integer 	NOT NULL,    /* PK */
	`StartTime`	        DateTime	NULL,
	`EndTime`	        DateTime	NULL,
	`Date`	            	date		NULL,
	`TotalSeat`	        integer		NULL,
	`ReservedSeat`	    	integer		NULL,
	`ScreeningSpace`	varchar(8)	NULL,
	`MovieCode`	        integer		NOT NULL,    /* FK Movie */
	`Branch`	        Varchar(50)	NOT NULL,    /* FK MovieBranch */

    CONSTRAINT PK_ScreeningMovie PRIMARY KEY (ScreeningNumber)
);

CREATE TABLE `Seat_ScreeningNumber` (
	`SeatNumber`	    	varchar(8) 	NOT NULL,       		/* PK */
	`ReserveStatus`   	boolean		NULL,
	`ScreeningNumber`	integer		NOT NULL,                       /* FK ScreeningNumber */

    CONSTRAINT PK_Seat_ScreeningNumber PRIMARY KEY (SeatNumber)
);

CREATE TABLE `NonMemberInfo` (
	`ReserveNumber`	varchar(50)	NOT NULL,   /* PK */ /* FK ReserveSeatInfo */
	`Name`	        varchar(50)	NULL,
	`PW`	        varchar(128)	NULL,
	`Birthday`	date		NULL,
	`PhoneNumber`	varchar(100)	NULL,

    CONSTRAINT PK_NonMemberInfo PRIMARY KEY (ReserveNumber)
);

CREATE TABLE `ReserveSeatInfo` (
	`SeatNumber`	varchar(8) 	NOT NULL,       	/* PK */
	`PeopleType`	varchar(8)	NULL,
	`ReserveNumber`	Varchar(50)	NOT NULL,               /* FK ReservationInfo */

    CONSTRAINT PK_ReserveSeatInfo PRIMARY KEY (SeatNumber)
);

CREATE TABLE `ReservationInfo` (
	`ReserveNumber`	    	Varchar(50)	NOT NULL,    /* PK */
	`MemberStatus`	    	boolean		NULL,
	`PaymentNumber`	    	Varchar		NULL,
	`ReserveDate`	    	date		NULL,
	`ReservePlace`	    	varchar(8)	NULL,
	`TicketIssueStatus`	boolean		NULL,
	`ReserveCancel`	    	integer		NULL,
	`ScreeningNumber`	integer		NOT NULL,    /* FK ScreeningMovie */

    CONSTRAINT PK_ReservationInfo PRIMARY KEY (ReserveNumber)
);

CREATE TABLE `PaymentInfo` (
	`PaymentNumber`	Varchar(50)	NOT NULL,    /* PK */
	`PaymentMethod`	varchar(50)	NOT NULL,    /* PK */
	`Amount`	integer		NULL,
	`ReserveNumber`	Varchar(50)	NOT NULL,    /* FK ReservationInfo */
    
    CONSTRAINT PK_PaymentInfo PRIMARY KEY (PaymentNumber, PaymentMethod)
);

CREATE TABLE `MemberInfo` (
	`ID`	            varchar(50) 	NOT NULL,           /* PK */
	`PW`	            varchar(128)	NULL,
	`Name`	            varchar(50)		NULL,
	`PhoneNumber`	    varchar(100)	NULL,
	`Birthday`          date		NULL,
	`Point`	            integer		NULL,
	`AccumulatedPoint`  integer		NULL,

    CONSTRAINT PK_MemberInfo PRIMARY KEY (ID)
);

CREATE TABLE `Reservation_Member` (
	`ReserveNumber`	varchar(50) 	NOT NULL,       /* PK */ /* FK ReservationInfo */
	`ID`	        varchar(50)	NOT NULL,       /* FK MemberInfo */

    CONSTRAINT PK_Reservation_Member PRIMARY KEY (ReserveNumber)
);

CREATE TABLE `MovieBranch` (
	`Branch`	varchar(50)	NOT NULL,       /* PK */
	`Name`	        varchar(50)	NULL,
	`EachNumber`	integer		NOT NULL,       /* FK EachFacility */
	`ProductNumber`	varchar(50)	NOT NULL,       /* FK EachFacility */

    CONSTRAINT PK_MovieBranch PRIMARY KEY (Branch)
);

/* FK */
ALTER TABLE `Staff` ADD CONSTRAINT `FK_MovieBranch_TO_Staff_1` FOREIGN KEY (
	`Branch`
)
REFERENCES `MovieBranch` (
	`Branch`
);

ALTER TABLE `Holiday` ADD CONSTRAINT `FK_Staff_TO_Holiday_1` FOREIGN KEY (
	`EmployeeID`
)
REFERENCES `Staff` (
	`EmployeeID`
);

ALTER TABLE `Holiday` ADD CONSTRAINT `FK_Monthly_work_TO_Holiday_1` FOREIGN KEY (
	`Year-Month`
)
REFERENCES `Monthly_work` (
	`Year-Month`
);

ALTER TABLE `Commute` ADD CONSTRAINT `FK_Staff_TO_Commute_1` FOREIGN KEY (
	`EmployeeID`
)
REFERENCES `Staff` (
	`EmployeeID`
);

ALTER TABLE `Commute` ADD CONSTRAINT `FK_Monthly_work_TO_Commute_1` FOREIGN KEY (
	`Year-Month`
)
REFERENCES `Monthly_work` (
	`Year-Month`
);

ALTER TABLE `Monthly_work` ADD CONSTRAINT `FK_Staff_TO_Monthly_work_1` FOREIGN KEY (
	`EmployeeID`
)
REFERENCES `Staff` (
	`EmployeeID`
);

ALTER TABLE `Monthly_Salary` ADD CONSTRAINT `FK_Staff_TO_Monthly_Salary_1` FOREIGN KEY (
	`EmployeeID`
)
REFERENCES `Staff` (
	`EmployeeID`
);

ALTER TABLE `Monthly_Salary` ADD CONSTRAINT `FK_Monthly_work_TO_Monthly_Salary_1` FOREIGN KEY (
	`Year-Month`
)
REFERENCES `Monthly_work` (
	`Year-Month`
);

ALTER TABLE `SaleRecords_Snackbar` ADD CONSTRAINT `FK_Product_Snackbar_TO_SaleRecords_Snackbar_1` FOREIGN KEY (
	`ProductNumber`
)
REFERENCES `Product_Snackbar` (
	`ProductNumber`
);

ALTER TABLE `Department` ADD CONSTRAINT `FK_MovieBranch_TO_Department_1` FOREIGN KEY (
	`Branch`
)
REFERENCES `MovieBranch` (
	`Branch`
);

ALTER TABLE `OrderReturnRequest` ADD CONSTRAINT `FK_Delivery_TO_OrderReturnRequest_1` FOREIGN KEY (
	`OrderNumber`
)
REFERENCES `Delivery` (
	`OrderNumber`
);

ALTER TABLE `OrderReturnRequest` ADD CONSTRAINT `FK_Product_Snackbar_TO_OrderReturnRequest_1` FOREIGN KEY (
	`ProductNumber`
)
REFERENCES `Product_Snackbar` (
	`ProductNumber`
);

ALTER TABLE `OrderReturnRequest` ADD CONSTRAINT `FK_Department_TO_OrderReturnRequest_1` FOREIGN KEY (
	`DepartmentNumber`
)
REFERENCES `Department` (
	`DepartmentNumber`
);

ALTER TABLE `OrderReturnRequest` ADD CONSTRAINT `FK_EachFacility_TO_OrderReturnRequest_1` FOREIGN KEY (
	`EachNumber`
)
REFERENCES `EachFacility` (
	`EachNumber`
);

ALTER TABLE `Product_Snackbar` ADD CONSTRAINT `FK_MovieBranch_TO_Product_Snackbar_1` FOREIGN KEY (
	`Branch`
)
REFERENCES `MovieBranch` (
	`Branch`
);

ALTER TABLE `Location` ADD CONSTRAINT `FK_MovieBranch_TO_Location_1` FOREIGN KEY (
	`Branch`
)
REFERENCES `MovieBranch` (
	`Branch`
);

ALTER TABLE `EachFacility` ADD CONSTRAINT `FK_Product_TO_EachFacility_1` FOREIGN KEY (
	`ProductNumber`
)
REFERENCES `Product` (
	`ProductNumber`
);

ALTER TABLE `EachFacility` ADD CONSTRAINT `FK_Location_TO_EachFacility_1` FOREIGN KEY (
	`LocationNumber`
)
REFERENCES `Location` (
	`LocationNumber`
);

ALTER TABLE `Discard` ADD CONSTRAINT `FK_EachFacility_TO_Discard_1` FOREIGN KEY (
	`EachNumber`
)
REFERENCES `EachFacility` (
	`EachNumber`
);

ALTER TABLE `Discard` ADD CONSTRAINT `FK_EachFacility_TO_Discard_2` FOREIGN KEY (
	`ProductNumber`
)
REFERENCES `EachFacility` (
	`ProductNumber`
);

ALTER TABLE `Discard` ADD CONSTRAINT `FK_MovieBranch_TO_Discard_1` FOREIGN KEY (
	`Branch`
)
REFERENCES `MovieBranch` (
	`Branch`
);

ALTER TABLE `FacilityRepair` ADD CONSTRAINT `FK_EachFacility_TO_FacilityRepair_1` FOREIGN KEY (
	`EachNumber`
)
REFERENCES `EachFacility` (
	`EachNumber`
);

ALTER TABLE `FacilityRepair` ADD CONSTRAINT `FK_EachFacility_TO_FacilityRepair_2` FOREIGN KEY (
	`ProductNumber`
)
REFERENCES `EachFacility` (
	`ProductNumber`
);

ALTER TABLE `ScreeningMovie` ADD CONSTRAINT `FK_Movie_TO_ScreeningMovie_1` FOREIGN KEY (
	`MovieCode`
)
REFERENCES `Movie` (
	`MovieCode`
);

ALTER TABLE `ScreeningMovie` ADD CONSTRAINT `FK_MovieBranch_TO_ScreeningMovie_1` FOREIGN KEY (
	`Branch`
)
REFERENCES `MovieBranch` (
	`Branch`
);

ALTER TABLE `Seat_ScreeningNumber` ADD CONSTRAINT `FK_ScreeningMovie_TO_Seat_ScreeningNumber_1` FOREIGN KEY (
	`ScreeningNumber`
)
REFERENCES `ScreeningMovie` (
	`ScreeningNumber`
);

ALTER TABLE `NonMemberInfo` ADD CONSTRAINT `FK_ReservationInfo_TO_NonMemberInfo_1` FOREIGN KEY (
	`ReserveNumber`
)
REFERENCES `ReservationInfo` (
	`ReserveNumber`
);

ALTER TABLE `ReserveSeatInfo` ADD CONSTRAINT `FK_Seat_ScreeningNumber_TO_ReserveSeatInfo_1` FOREIGN KEY (
	`SeatNumber`
)
REFERENCES `Seat_ScreeningNumber` (
	`SeatNumber`
);

ALTER TABLE `ReserveSeatInfo` ADD CONSTRAINT `FK_ReservationInfo_TO_ReserveSeatInfo_1` FOREIGN KEY (
	`ReserveNumber`
)
REFERENCES `ReservationInfo` (
	`ReserveNumber`
);

ALTER TABLE `ReservationInfo` ADD CONSTRAINT `FK_ScreeningMovie_TO_ReservationInfo_1` FOREIGN KEY (
	`ScreeningNumber`
)
REFERENCES `ScreeningMovie` (
	`ScreeningNumber`
);

ALTER TABLE `PaymentInfo` ADD CONSTRAINT `FK_ReservationInfo_TO_PaymentInfo_1` FOREIGN KEY (
	`ReserveNumber`
)
REFERENCES `ReservationInfo` (
	`ReserveNumber`
);

ALTER TABLE `Reservation_Member` ADD CONSTRAINT `FK_ReservationInfo_TO_Reservation_Member_1` FOREIGN KEY (
	`ReserveNumber`
)
REFERENCES `ReservationInfo` (
	`ReserveNumber`
);

ALTER TABLE `Reservation_Member` ADD CONSTRAINT `FK_MemberInfo_TO_Reservation_Member_1` FOREIGN KEY (
	`ID`
)
REFERENCES `MemberInfo` (
	`ID`
);

ALTER TABLE `MovieBranch` ADD CONSTRAINT `FK_EachFacility_TO_MovieBranch_1` FOREIGN KEY (
	`EachNumber`
)
REFERENCES `EachFacility` (
	`EachNumber`
);

ALTER TABLE `MovieBranch` ADD CONSTRAINT `FK_EachFacility_TO_MovieBranch_2` FOREIGN KEY (
	`ProductNumber`
)
REFERENCES `EachFacility` (
	`ProductNumber`
);
