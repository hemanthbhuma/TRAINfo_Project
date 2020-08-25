-- USING ORACLE AS A DOCKER CONTAINER
-------------------------------------

-- docker login -u <your username> -p <your password>
-- docker pull store/oracle/database-enterprise:12.2.0.1
-- docker run -d -p 1521:1521 --name oracle store/oracle/database-enterprise:12.2.0.1
-- docker ps -a
-- docker exec -it <container_id_or_name> bash -c "source /home/oracle/.bashrc; sqlplus /nolog"


-- COMMANDS TO BE EXECUTED INSIDE DOCKER CONTAINER
--------------------------------------------------

-- connect sys/Oradoc_db1 as sysdba;
-- alter session set "_ORACLE_SCRIPT" = TRUE;

-- CREATE USER trainfo IDENTIFIED BY trainfo;
-- GRANT ALL PRIVILEGES TO trainfo;
-- GRANT CONNECT, RESOURCE, DBA TO trainfo;
-- GRANT CREATE SESSION TO trainfo;
-- GRANT UNLIMITED TABLESPACE TO trainfo;

-- exit;


-- IF USING DOCKER, THEN BELOW ARE THE CONNECTION DETAILS TO CONNECT FROM SQL DEVELOPER
---------------------------------------------------------------------------------------

-- CONNECTION NAME = <any suitable connection name> Ex: docker_oracle
-- USERNAME = trainfo
-- PASSWORD = trainfo
-- SERVICE_NAME = ORCLCDB.localdomain


------------------------------------------------------------------------------------------------------------------------------------

-- Note: don't chaneg the below values unless u know them
create table if not exists TRAINFARE (
	tclass VARCHAR(50),
	startdist DECIMAL(5,2),
	enddist DECIMAL(5,2),
	totdist DECIMAL(5,2),
	per_km_fare DECIMAL(5,2),
	class_no INT
);
insert into TRAINFARE (tclass, startdist, enddist, totdist, per_km_fare, class_no) values ('First',  1.00,   50.00,    50.00,   1.00, 1);
insert into TRAINFARE (tclass, startdist, enddist, totdist, per_km_fare, class_no) values ('First',  51.00,  500.00,   449.00,  1.20, 1);
insert into TRAINFARE (tclass, startdist, enddist, totdist, per_km_fare, class_no) values ('First',  501.00, 10000.00, 9449.00, 1.50, 1);
insert into TRAINFARE (tclass, startdist, enddist, totdist, per_km_fare, class_no) values ('Second', 1.00,   50.00,    50.00,   0.75, 2);
insert into TRAINFARE (tclass, startdist, enddist, totdist, per_km_fare, class_no) values ('Second', 51.00,  500.00,   449.00,  1.00, 2);
insert into TRAINFARE (tclass, startdist, enddist, totdist, per_km_fare, class_no) values ('Second', 501.00, 10000.00, 9449.00, 1.20, 2);
insert into TRAINFARE (tclass, startdist, enddist, totdist, per_km_fare, class_no) values ('Third',  1.00,   50.00,    50.00,   0.50, 3);
insert into TRAINFARE (tclass, startdist, enddist, totdist, per_km_fare, class_no) values ('Third',  51.00,  500.00,   449.00,  0.75, 3);
insert into TRAINFARE (tclass, startdist, enddist, totdist, per_km_fare, class_no) values ('Third',  501.00, 10000.00, 9449.00, 1.00, 3);

-- You can change the contents of the below table if necessary 
create table if not exists TRAINREG (
	uname VARCHAR(50),
	pword VARCHAR(50),
	fname VARCHAR(50),
	lname VARCHAR(50),
	addr VARCHAR(50),
	phno VARCHAR(50),
	mid VARCHAR(50)
);
insert into TRAINREG (uname, pword, fname, lname, addr, phno, mid) values ('revanth', 'revanth123', 'Revanth', 'Vermareddy', 'Teachers Colony', '9999999999', 'vermareddyrevanth@gmail.com');
insert into TRAINREG (uname, pword, fname, lname, addr, phno, mid) values ('user', 'user123', 'User', 'Name', 'sample address', '1111111111', 'user@gmail.com');

-- You can change the contents of the below table if necessary 
create table if not exists TRAINDATA (
	trainno INT,
	trainname VARCHAR(50),
	from_station VARCHAR(50),
	to_station VARCHAR(50),
	avail VARCHAR(50),
	dist DECIMAL(5,2)
);
insert into TRAINDATA (trainno, trainname, from_station, to_station, avail, dist) values (12703, 'Falaknuma Express', 'Secunderabad', 'Howrah', true, 1544.00);
insert into TRAINDATA (trainno, trainname, from_station, to_station, avail, dist) values (12759, 'Charminar Express', 'Chennai', 'Hyderabad', true, 1676.00);
insert into TRAINDATA (trainno, trainname, from_station, to_station, avail, dist) values (12727, 'Godavari Express', 'Visakhapatnam', 'Hyderabad', true, 710.00);
insert into TRAINDATA (trainno, trainname, from_station, to_station, avail, dist) values (11019, 'Konark Express', 'Secunderabad', 'Bhubaneshwar', true, 	1932.00);
insert into TRAINDATA (trainno, trainname, from_station, to_station, avail, dist) values (18645, 'East Coast Express', 'Hyderabad', 'Howrah', false, 1592.00);

-- You can change the contents of the below table if necessary 
create table if not exists TRAINADMINLOGIN (
	aname VARCHAR(50),
	pword VARCHAR(50),
	fname VARCHAR(50),
	lname VARCHAR(50)
);
insert into TRAINADMINLOGIN (aname, pword, fname, lname) values ('admin', 'admin123', 'Admin', 'Admin');
insert into TRAINADMINLOGIN (aname, pword, fname, lname) values ('revanth', 'revanth123', 'Revanth', 'Vermareddy');

-----------------------------------------------------------------------------------------------




