using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserCustomer
/// </summary>
public class UserCustomer
{

    private int id;
    private string username;
    private string passwordhash;
    private string passwordsalt;
    private string phoneNo;
    private string address;
    private string firstName;
    private string lastname;
    private string emmail;
    private string age;
    public UserCustomer()
    {
        //
        // TODO: Add constructor logic here

    }


    public UserCustomer(int id, string username, string passwordhash, string passwordsalt, string phoneNo, string address, string firstName, string lastname, string email, string age)
    {
        this.id = id;
        this.username = username;
        this.passwordhash = passwordhash;
        this.passwordsalt = passwordsalt;
        this.phoneNo = phoneNo;
        this.address = address;
        this.firstName = firstName;
        this.lastname = lastname;
        this.emmail = email;
        this.age = age;
    }
    public int Id
    {
        get
        {
            return id;
        }

        set
        {
            id = value;
        }
    }

    public string Username
    {
        get
        {
            return username;
        }

        set
        {
            username = value;
        }
    }

    public string Passwordhash
    {
        get
        {
            return passwordhash;
        }

        set
        {
            passwordhash = value;
        }
    }

    public string Passwordsalt
    {
        get
        {
            return passwordsalt;
        }

        set
        {
            passwordsalt = value;
        }
    }

    public string PhoneNo
    {
        get
        {
            return phoneNo;
        }

        set
        {
            phoneNo = value;
        }
    }

    public string Address
    {
        get
        {
            return address;
        }

        set
        {
            address = value;
        }
    }

    public string FirstName
    {
        get
        {
            return firstName;
        }

        set
        {
            firstName = value;
        }
    }

    public string Lastname
    {
        get
        {
            return lastname;
        }

        set
        {
            lastname = value;
        }
    }

    public string Emmail
    {
        get
        {
            return emmail;
        }

        set
        {
            emmail = value;
        }
    }









}