CREATE TABLE [dbo].[empdeptdetails](
	[empno] [int] NOT NULL,
	[ename] [nvarchar](10) NULL,
	[job] [nvarchar](9) NULL,
	[mgr] [int] NULL,
	[hiredate] [date] NULL,
	[sal] [float] NULL,
	[comm] [int] NULL,
	[dname] [nvarchar](14) NULL
) ON [PRIMARY]

INSERT [dbo].[empdeptdetails] VALUES (7369, N'SMITH', N'CLERK', 7902, CAST(N'1980-12-17' AS Date), 800, NULL, N'RESEARCH')
INSERT [dbo].[empdeptdetails]  VALUES (7499, N'ALLEN', N'SALESMAN', 7698, CAST(N'1981-02-20' AS Date), 1600, 300, N'SALES')
INSERT [dbo].[empdeptdetails] VALUES (7521, N'WARD', N'SALESMAN', 7698, CAST(N'1981-02-22' AS Date), 1250, 500, N'SALES')
INSERT [dbo].[empdeptdetails] VALUES (7566, N'JONES', N'MANAGER', 7839, CAST(N'1981-04-02' AS Date), 2975, NULL, N'RESEARCH')
INSERT [dbo].[empdeptdetails] VALUES (7654, N'MARTIN', N'SALESMAN', 7698, CAST(N'1981-09-28' AS Date), 1250, 1400, N'SALES')
INSERT [dbo].[empdeptdetails]  VALUES (7698, N'BLAKE', N'MANAGER', 7839, CAST(N'1981-05-01' AS Date), 2850, NULL, N'SALES')
INSERT [dbo].[empdeptdetails] VALUES (7782, N'CLARK', N'MANAGER', 7839, CAST(N'1981-06-09' AS Date), 2450, NULL, N'ACCOUNTING')
INSERT [dbo].[empdeptdetails]  VALUES (7788, N'SCOTT', N'ANALYST', 7566, CAST(N'1987-07-13' AS Date), 3000, NULL, N'RESEARCH')
INSERT [dbo].[empdeptdetails] VALUES (7839, N'KING', N'PRESIDENT', NULL, CAST(N'1981-11-17' AS Date), 5000, NULL, N'ACCOUNTING')
INSERT [dbo].[empdeptdetails]  VALUES (7844, N'TURNER', N'SALESMAN', 7698, CAST(N'1981-09-08' AS Date), 1500, 0, N'SALES')
INSERT [dbo].[empdeptdetails]  VALUES (7876, N'ADAMS', N'CLERK', 7788, CAST(N'1987-07-13' AS Date), 1100, NULL, N'RESEARCH')
INSERT [dbo].[empdeptdetails]  VALUES (7900, N'JAMES', N'CLERK', 7698, CAST(N'1981-12-03' AS Date), 950, NULL, N'SALES')
INSERT [dbo].[empdeptdetails] VALUES (7902, N'FORD', N'ANALYST', 7566, CAST(N'1981-12-03' AS Date), 3000, NULL, N'RESEARCH')
INSERT [dbo].[empdeptdetails]  VALUES (7934, N'MILLER', N'CLERK', 7782, CAST(N'1982-01-23' AS Date), 1300, NULL, N'ACCOUNTING')
