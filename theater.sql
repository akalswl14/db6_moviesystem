﻿CREATE TABLE `Staff` (
	`EmployeeID`	integer	NOT NULL,
	`PW`	varchar2(20)	NULL,
	`Name`	varchar2(50)	NULL,
	`Birthday`	date	NULL,
	`Sex`	varchar2(5)	NULL,
	`Position`	varchar2(50)	NULL,
	`Phonenumber`	varchar2(100)	NULL,
	`Address`	varchar2(225)	NULL,
	`Team`	varchar2(50)	NULL,
	`JoinDate`	date	NULL,
	`HolidayNumber`	integer	NULL,
	`Department`	varchar2(50)	NULL,
	`AccountNumber`	varchar2(50)	NULL,
	`Bank`	varchar2(20)	NULL,
	`Salary`	integer	NULL,
	`Branch`	varchar2(50)	NOT NULL
);

CREATE TABLE `Holiday` (
	`StartDate`	date	NOT NULL,
	`EndDate`	date	NOT NULL,
	`EmployeeID`	integer	NOT NULL,
	`Type`	varchar2(20)	NULL,
	`Year-Month`	varchar2(10)	NOT NULL
);

CREATE TABLE `Commute` (
	`Date`	day	NOT NULL,
	`Time`	integer	NOT NULL,
	`EmployeeID`	integer	NOT NULL,
	`BarcodeNumber`	varchar2(20)	NULL,
	`Year-Month`	varchar2(10)	NOT NULL
);

CREATE TABLE `Monthly_work` (
	`Year-Month`	varchar2(10)	NOT NULL,
	`EmployeeID`	integer	NOT NULL,
	`GeneralWorkHours`	integer	NULL,
	`Late`	integer	NULL,
	`UseHoliday`	integer	NULL,
	`OverworkHours`	integer	NULL
);

CREATE TABLE `Monthly_Salary` (
	`EmployeeID`	integer	NOT NULL,
	`Year-Month`	varchar2(10)	NOT NULL,
	`GeneralworkSalary`	integer	NULL,
	`OverworkSalary`	integer	NULL,
	`ExtraPay`	integer	NULL,
	`PaymentStatus`	boolean	NULL
);

CREATE TABLE `SaleRecords_Snackbar` (
	`Date`	date	NOT NULL,
	`ProductNumber`	varchar2(50)	NOT NULL,
	`Sale`	integer	NULL,
	`Exchange`	integer	NULL,
	`Refund`	integer	NULL
);

CREATE TABLE `Delivery` (
	`OrderNumber`	varchar2(50)	NOT NULL,
	`DeliveryNumber`	varchar2(50)	NULL,
	`ExceptDate`	date	NULL
);

CREATE TABLE `Department` (
	`DepartmentNumber`	integer	NOT NULL,
	`Name`	varchar2(50)	NULL,
	`Branch`	varchar2(50)	NOT NULL
);

CREATE TABLE `OrderReturnRequest` (
	`OrderNumber`	varchar2(50)	NOT NULL,
	`Date`	date	NULL,
	`OrderAmount`	integer	NULL,
	`ReturnAmount`	integer	NULL,
	`TotalPrice`	integer	NULL,
	`ProductNumber`	varchar2(50)	NOT NULL,
	`DepartmentNumber`	integer	NOT NULL,
	`EachNumber`	integer	NOT NULL
);

CREATE TABLE `Product_Snackbar` (
	`ProductNumber`	varchar2(50)	NOT NULL,
	`Name`	varchar2(50)	NULL,
	`Stock`	integer	NULL,
	`Price`	integer	NULL,
	`Branch`	varchar2(50)	NOT NULL
);

CREATE TABLE `Product` (
	`ProductNumber`	varchar2(50)	NOT NULL,
	`Name`	varchar2(50)	NULL,
	`Price`	integer	NULL,
	`Category`	varchar2(20)	NULL
);

CREATE TABLE `Location` (
	`LocationNumber`	integer	NOT NULL,
	`Name`	varchar2(30)	NULL,
	`Branch`	varchar2(50)	NOT NULL
);

CREATE TABLE `EachFacility` (
	`EachNumber`	integer	NOT NULL,
	`ProductNumber`	varchar2(50)	NOT NULL,
	`Status`	varchar2(50)	NULL,
	`BuyDate`	date	NULL,
	`LocationNumber`	integer	NOT NULL
);

CREATE TABLE `Discard` (
	`EachNumber`	integer	NOT NULL,
	`ProductNumber`	varchar2(50)	NOT NULL,
	`RequestDate`	date	NULL,
	`DiscardType`	varchar2(255)	NULL,
	`LocationNumber`	integer	NULL,
	`Status`	varchar2(20)	NULL,
	`DiscardDate`	date	NULL,
	`Branch`	varchar2(50)	NOT NULL
);

CREATE TABLE `FacilityRepair` (
	`DepartNumber`	integer	NOT NULL,
	`EachNumber`	integer	NOT NULL,
	`ProductNumber`	varchar2(50)	NOT NULL,
	`RequestDate`	date	NULL,
	`Detail`	varchar2(255)	NULL
);

CREATE TABLE `Movie` (
	`MovieCode`	integer	NOT NULL,
	`Name`	varchar2(50)	NULL,
	`Rate`	float	NULL,
	`Genre`	String	NULL,
	`BookingRate`	float	NULL,
	`Type`	integer	NULL,
	`ReleaseDate`	date(8)	NULL,
	`RunningTime`	time(8)	NULL,
	`Cast`	String	NULL,
	`TotalAttendance`	integer	NULL,
	`AgeLimit`	integer	NULL,
	`Poster`	varchar2(50)	NULL,
	`Story`	text	NULL,
	`ScreenType`	integer	NULL,
	`Director`	varchar2(50)	NULL
);

CREATE TABLE `ScreeningMovie` (
	`ScreeningNumber`	integer	NOT NULL,
	`StartTime`	DateTime	NULL,
	`EndTime`	DateTime	NULL,
	`Date`	date	NULL,
	`TotalSeat`	integer	NULL,
	`ReservedSeat`	integer	NULL,
	`ScreeningSpace`	String	NULL,
	`MovieCode`	integer	NOT NULL,
	`Branch`	varchar2(50)	NOT NULL
);

CREATE TABLE `Seat_ScreeningNumber` (
	`SeatNumber`	String	NOT NULL,
	`ReserveStatus`	boolean	NULL,
	`ScreeningNumber`	integer	NOT NULL
);

CREATE TABLE `NonMemberInfo` (
	`ReserveNumber`	varchar2(50)	NOT NULL,
	`Name`	varchar2(50)	NULL,
	`PW`	varchar2(128)	NULL,
	`Birthday`	date	NULL,
	`PhoneNumber`	varchar2(100)	NULL
);

CREATE TABLE `ReserveSeatInfo` (
	`SeatNumber`	String	NOT NULL,
	`PeopleType`	String	NULL,
	`ReserveNumber`	varchar2(50)	NOT NULL
);

CREATE TABLE `ReservationInfo` (
	`ReserveNumber`	varchar2(50)	NOT NULL,
	`MemberStatus`	boolean	NULL,
	`PaymentNumber`	varchar2	NULL,
	`ReserveDate`	date	NULL,
	`ReservePlace`	String	NULL,
	`TicketIssueStatus`	boolean	NULL,
	`ReserveCancel`	integer	NULL,
	`ScreeningNumber`	integer	NOT NULL
);

CREATE TABLE `PaymentInfo` (
	`PaymentNumber`	varchar2(50)	NOT NULL,
	`PaymentMethod`	varchar2(50)	NOT NULL,
	`Amount`	integer	NULL,
	`ReserveNumber`	varchar2(50)	NOT NULL
);

CREATE TABLE `MemberInfo` (
	`ID`	varchar2(50)	NOT NULL,
	`PW`	varchar2(128)	NULL,
	`Name`	varchar2(50)	NULL,
	`PhoneNumber`	varchar2(100)	NULL,
	`Birthday`	date	NULL,
	`Point`	integer	NULL,
	`AccumulatedPoint`	integer	NULL
);

CREATE TABLE `Reservation_Member` (
	`ReserveNumber`	varchar2(50)	NOT NULL,
	`ID`	varchar2(50)	NOT NULL
);

CREATE TABLE `MovieBranch` (
	`Branch`	varchar2(50)	NOT NULL,
	'District'	varchar2(50) NOT NULL, /* 점포 속성 - 지역 */
	`Name`	varchar2(50)	NULL,
	`EachNumber`	integer	NOT NULL,
	`ProductNumber`	varchar2(50)	NOT NULL
);

ALTER TABLE `Staff` ADD CONSTRAINT `PK_STAFF` PRIMARY KEY (
	`EmployeeID`
);

ALTER TABLE `Holiday` ADD CONSTRAINT `PK_HOLIDAY` PRIMARY KEY (
	`StartDate`,
	`EndDate`,
	`EmployeeID`
);

ALTER TABLE `Commute` ADD CONSTRAINT `PK_COMMUTE` PRIMARY KEY (
	`Date`,
	`Time`,
	`EmployeeID`
);

ALTER TABLE `Monthly_work` ADD CONSTRAINT `PK_MONTHLY_WORK` PRIMARY KEY (
	`Year-Month`,
	`EmployeeID`
);

ALTER TABLE `Monthly_Salary` ADD CONSTRAINT `PK_MONTHLY_SALARY` PRIMARY KEY (
	`EmployeeID`,
	`Year-Month`
);

ALTER TABLE `SaleRecords_Snackbar` ADD CONSTRAINT `PK_SALERECORDS_SNACKBAR` PRIMARY KEY (
	`Date`,
	`ProductNumber`
);

ALTER TABLE `Delivery` ADD CONSTRAINT `PK_DELIVERY` PRIMARY KEY (
	`OrderNumber`
);

ALTER TABLE `Department` ADD CONSTRAINT `PK_DEPARTMENT` PRIMARY KEY (
	`DepartmentNumber`
);

ALTER TABLE `OrderReturnRequest` ADD CONSTRAINT `PK_ORDERRETURNREQUEST` PRIMARY KEY (
	`OrderNumber`
);

ALTER TABLE `Product_Snackbar` ADD CONSTRAINT `PK_PRODUCT_SNACKBAR` PRIMARY KEY (
	`ProductNumber`
);

ALTER TABLE `Product` ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
	`ProductNumber`
);

ALTER TABLE `Location` ADD CONSTRAINT `PK_LOCATION` PRIMARY KEY (
	`LocationNumber`
);

ALTER TABLE `EachFacility` ADD CONSTRAINT `PK_EACHFACILITY` PRIMARY KEY (
	`EachNumber`,
	`ProductNumber`
);

ALTER TABLE `Discard` ADD CONSTRAINT `PK_DISCARD` PRIMARY KEY (
	`EachNumber`,
	`ProductNumber`
);

ALTER TABLE `FacilityRepair` ADD CONSTRAINT `PK_FACILITYREPAIR` PRIMARY KEY (
	`DepartNumber`,
	`EachNumber`,
	`ProductNumber`
);

ALTER TABLE `Movie` ADD CONSTRAINT `PK_MOVIE` PRIMARY KEY (
	`MovieCode`
);

ALTER TABLE `ScreeningMovie` ADD CONSTRAINT `PK_SCREENINGMOVIE` PRIMARY KEY (
	`ScreeningNumber`
);

ALTER TABLE `Seat_ScreeningNumber` ADD CONSTRAINT `PK_SEAT_SCREENINGNUMBER` PRIMARY KEY (
	`SeatNumber`
);

ALTER TABLE `NonMemberInfo` ADD CONSTRAINT `PK_NONMEMBERINFO` PRIMARY KEY (
	`ReserveNumber`
);

ALTER TABLE `ReserveSeatInfo` ADD CONSTRAINT `PK_RESERVESEATINFO` PRIMARY KEY (
	`SeatNumber`
);

ALTER TABLE `ReservationInfo` ADD CONSTRAINT `PK_RESERVATIONINFO` PRIMARY KEY (
	`ReserveNumber`
);

ALTER TABLE `PaymentInfo` ADD CONSTRAINT `PK_PAYMENTINFO` PRIMARY KEY (
	`PaymentNumber`,
	`PaymentMethod`
);

ALTER TABLE `MemberInfo` ADD CONSTRAINT `PK_MEMBERINFO` PRIMARY KEY (
	`ID`
);

ALTER TABLE `Reservation_Member` ADD CONSTRAINT `PK_RESERVATION_MEMBER` PRIMARY KEY (
	`ReserveNumber`
);

ALTER TABLE `MovieBranch` ADD CONSTRAINT `PK_MOVIEBRANCH` PRIMARY KEY (
	`Branch`
);

ALTER TABLE `Holiday` ADD CONSTRAINT `FK_Staff_TO_Holiday_1` FOREIGN KEY (
	`EmployeeID`
)
REFERENCES `Staff` (
	`EmployeeID`
);

ALTER TABLE `Commute` ADD CONSTRAINT `FK_Staff_TO_Commute_1` FOREIGN KEY (
	`EmployeeID`
)
REFERENCES `Staff` (
	`EmployeeID`
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

ALTER TABLE `OrderReturnRequest` ADD CONSTRAINT `FK_Delivery_TO_OrderReturnRequest_1` FOREIGN KEY (
	`OrderNumber`
)
REFERENCES `Delivery` (
	`OrderNumber`
);

ALTER TABLE `EachFacility` ADD CONSTRAINT `FK_Product_TO_EachFacility_1` FOREIGN KEY (
	`ProductNumber`
)
REFERENCES `Product` (
	`ProductNumber`
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

ALTER TABLE `Reservation_Member` ADD CONSTRAINT `FK_ReservationInfo_TO_Reservation_Member_1` FOREIGN KEY (
	`ReserveNumber`
)
REFERENCES `ReservationInfo` (
	`ReserveNumber`
);
