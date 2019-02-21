using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Diagnostics;

public class DBAcme
{
    private string connStr = @"Data Source=kANAIYAARYA2F15\KANAIYA;Initial Catalog=Web-BasedChatApplication(WBCA);Integrated Security=True";
    private SqlCommand cmd;
    private SqlConnection conn;

    public DBAcme()
    {
        conn = new SqlConnection();
        conn.ConnectionString = connStr;
        cmd = conn.CreateCommand();
    }
    public int InsertUser(string email, string userName, string password, string confirmPassword, string phone)
    {
        cmd.CommandText =
            "insert into Register (Email,userName, Password, ConfirmPassword, Phone)" +
            "values (@email,@userName, @password, @confirmPassword, @phone)";
        conn.Close();

        cmd.Parameters.Clear();
        SqlParameter p = new SqlParameter("@userName", DbType.String);
        p.Direction = ParameterDirection.Input;
        p.Value = userName;
        cmd.Parameters.Add(p);

        p = new SqlParameter("@password", DbType.String);
        p.Direction = ParameterDirection.Input;
        p.Value = password;
        cmd.Parameters.Add(p);

        p = new SqlParameter("@confirmPassword", DbType.String);
        p.Direction = ParameterDirection.Input;
        p.Value = confirmPassword;
        cmd.Parameters.Add(p);

        p = new SqlParameter("@email", DbType.String);
        p.Direction = ParameterDirection.Input;
        p.Value = email;
        cmd.Parameters.Add(p);

        p = new SqlParameter("@phone", DbType.String);
        p.Direction = ParameterDirection.Input;
        p.Value = phone;
        cmd.Parameters.Add(p);

        conn.Open();
        int numrow = cmd.ExecuteNonQuery();
        conn.Close();
        return numrow;

    }

    public Boolean GetUser(string userName, string password)
    {
        conn.Close();
        Boolean flag = false;
        cmd.CommandText = "select UserName,Password from Register where UserName=@userName and Password=@password";
        cmd.Parameters.Clear();
        conn.Open();
        SqlParameter p = new SqlParameter("@userName", DbType.String);
        p.Direction = ParameterDirection.Input;
        p.Value = userName;
        cmd.Parameters.Add(p);

        p = new SqlParameter("@password", DbType.String);
        p.Direction = ParameterDirection.Input;
        p.Value = password;
        cmd.Parameters.Add(p);

        //conn.Open();
        string reader = (string)cmd.ExecuteScalar();
        if (reader != null)
        {
            flag = true;
        }
        conn.Close();
        return flag;
    }
    public int InsertMessage(string message, string sender, string receiver, DateTime sendDate)
    {
        cmd.CommandText =
            "insert into MessageTable (Message,Sender,Receiver,SendDate)" +
            "values (@message,@sender,@receiver,@sendDate)";
        //conn.Open();

        cmd.Parameters.Clear();
        SqlParameter p = new SqlParameter("@message", DbType.String);
        p.Direction = ParameterDirection.Input;
        p.Value = message;
        cmd.Parameters.Add(p);

        p = new SqlParameter("@sender", DbType.String);
        p.Direction = ParameterDirection.Input;
        p.Value = sender;
        cmd.Parameters.Add(p);

        p = new SqlParameter("@receiver", DbType.String);
        p.Direction = ParameterDirection.Input;
        p.Value = receiver;
        cmd.Parameters.Add(p);

        p = new SqlParameter("@sendDate", DbType.Date);
        p.Direction = ParameterDirection.Input;
        p.Value = sendDate;
        cmd.Parameters.Add(p);

        conn.Open();
        int numrow = cmd.ExecuteNonQuery();
        conn.Close();
        return numrow;

    }
    public int InsertFeedback(string name, string email, string subject, string feedbackMessage)
    {
        cmd.CommandText =
            "insert into FeedbackTable (Name,Email, Subject, FeedbackMessage)" +
            "values (@name,@email, @subject, @feedbackMessage)";
        //conn.Open();

        cmd.Parameters.Clear();
        SqlParameter p = new SqlParameter("@name", DbType.String);
        p.Direction = ParameterDirection.Input;
        p.Value = name;
        cmd.Parameters.Add(p);

        p = new SqlParameter("@email", DbType.String);
        p.Direction = ParameterDirection.Input;
        p.Value = email;
        cmd.Parameters.Add(p);

        p = new SqlParameter("@subject", DbType.String);
        p.Direction = ParameterDirection.Input;
        p.Value = subject;
        cmd.Parameters.Add(p);

        p = new SqlParameter("@feedbackMessage", DbType.String);
        p.Direction = ParameterDirection.Input;
        p.Value = feedbackMessage;
        cmd.Parameters.Add(p);

        conn.Open();
        int numrow = cmd.ExecuteNonQuery();
        conn.Close();
        return numrow;

    }
}