--
-- Table structure for table `Criminals`
-- Gives criminal record or history of the suspected persons
-- Relationship with Criminals and Report (1:M)
--

CREATE TABLE `Criminals` (
  `CriminalID` int(11)  NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `DoB` date NOT NULL,
  `NumberOfCrimes` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `Criminals`
  ADD PRIMARY KEY (`CriminalID`),
  ADD UNIQUE KEY `CriminalID` (`CriminalID`);

ALTER TABLE `Criminals`
  MODIFY `CriminalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- --------------------------------------------------------

--
-- Table structure for table `Fines`
-- Shows the details of a fine for the suspected persons
-- Has relationship with Fines and Reports (M:N)
--

CREATE TABLE `Fines` (
  `FineID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Amounts` int(20) NOT NULL,
  `Points` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `Fines`
  ADD PRIMARY KEY (`FineID`);

ALTER TABLE `Fines`
  MODIFY `FineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- --------------------------------------------------------

--
-- Table structure for table `Officers`
-- Information where it shows the data of the officers
-- Relationship with Officers and Reports (0:M)
--

CREATE TABLE `Officers` (
  `BadgeNumber` int(11) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `YearsOfService` int(3) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `Officers`
  ADD PRIMARY KEY (`BadgeNumber`),
  ADD UNIQUE KEY `BadgeNumber` (`BadgeNumber`);

-- --------------------------------------------------------

--
-- Table structure for table `ReportFines`
-- Composite table for M:N relationship between report and fine
-- Relationship with Reports and Fines (M:N)
--

CREATE TABLE `ReportFines` (
  `ReportID` int(11) NOT NULL,
  `FineID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `ReportFines`
  ADD KEY `ReportID` (`ReportID`),
  ADD KEY `FineID` (`FineID`);

ALTER TABLE `ReportFines`
  ADD CONSTRAINT `ReportFines_ibfk_1` FOREIGN KEY (`ReportID`) REFERENCES `Reports` (`ReportID`),
  ADD CONSTRAINT `ReportFines_ibfk_2` FOREIGN KEY (`FineID`) REFERENCES `Fines` (`FineID`);

-- --------------------------------------------------------

--
-- Table structure for table `Reports`
-- Data where it will store data of the report of an incident between the officers and the civilians
-- Relationship with Reports and Officers (1:M)
-- Relationship with Criminals and Reports (1:M)
-- Relationship with Fines and Reports (M:N)
--

CREATE TABLE `Reports` (
  `ReportID` int(11) NOT NULL,
  `CriminalID` int(11) NOT NULL,
  `BadgeNumber` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `Reports`
  ADD PRIMARY KEY (`ReportID`),
  ADD KEY `CriminalID` (`CriminalID`),
  ADD KEY `BadgeNumber` (`BadgeNumber`);

ALTER TABLE `Reports`
  MODIFY `ReportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `Reports`
  ADD CONSTRAINT `Reports_ibfk_1` FOREIGN KEY (`CriminalID`) REFERENCES `Criminals` (`CriminalID`),
  ADD CONSTRAINT `Reports_ibfk_2` FOREIGN KEY (`BadgeNumber`) REFERENCES `Officers` (`BadgeNumber`);