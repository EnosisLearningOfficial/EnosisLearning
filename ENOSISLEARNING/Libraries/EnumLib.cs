using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ENOSISLEARNING
{
    enum GENDER
    {
        MALE,
        FEMALE 
    }
    enum USERS
    {
        DIPALI,
        MANJU,
        DILLIP
    }
    enum CANTYPE
    {
        O,
        I,
        INTERN
    }
    enum USERROLES
    {
        COUNSELLOR,
        MANAGER,
        FACULTY,
        STUDENT

    }
    enum STATUS
    {
        A,
        X,
        ALL,
        INACTIVE = 0,
        ACTIVE = 1

    }

    enum MONTH
    {
        JAN = 1,
        FEB = 2,
        MAR = 3,
        APR = 4,
        MAY = 5,
        JUN = 6,
        JUL = 7,
        AUG = 8,
        SEP = 9,
        OCT = 10,
        NOV = 11,
        DEC = 12
    }

    enum COURSES
    {
        CCPP = 1,
        JAVA = 2,
        NET = 3,
        DESIGNING = 4,
        MSBI = 5,
        SQL = 6
    }
    enum OPERATION
    {
        ADD,
        EDIT
    }

  
}