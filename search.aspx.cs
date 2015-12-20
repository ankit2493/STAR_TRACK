using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Collections.Generic;

public partial class search : System.Web.UI.Page
{
    SqlCommand com;
    String str;
    double dwhole;
    double dfrac;
    double O;
    double L;
    double dw;
    double es;
    double eqeq;
    double GAST;
    double lg;
    double d;
    double GMST;
    double LST;
    double r;
    double t;
    double mcm;
    double sc;
    static double rah;
 static double ram;
 static double dech;
 static double decmin;
 static double decsec;
 static double dec;
 static double sec;
 double di;
 double dig = 0;
 static double lat;
 static double digr;
 static int D;
 static int m;
 static int y;
 static int h;
 static double min;
 static int w;
    double ay;
    double af;
    double aq;
    double ax;
    double sd;
    int hc;
    int mc;
       
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }
    protected void get_Click(object sender, EventArgs e)
    {
        
        SqlConnection con = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=star;Integrated Security=True");
        con.Open();
        str = "select * from catalog where name='" + name.Text.Trim() + "'";
        com = new SqlCommand(str, con);
        SqlDataReader reader = com.ExecuteReader();
        if (reader.Read())
        {
            name.Text =reader["name"].ToString();
            string cons = reader["constellation"].ToString();
            constellation.Text = cons;
            ra.Text = reader["rahr"].ToString()+"hr"+reader["ramin"].ToString()+"min"+reader["rasec"].ToString()+"sec";
            dect.Text = reader["decdeg"].ToString() + "deg" + reader["decmin"].ToString() + "min" + reader["decsec"].ToString() + "sec";
            rah = Convert.ToDouble(reader["rahr"]);
            ram = Convert.ToDouble(reader["ramin"]);
            dech = Convert.ToDouble(reader["decdeg"]);
            decmin = Convert.ToDouble(reader["decmin"]);
            decsec = Convert.ToDouble(reader["decsec"]);
            dec = convert(dech,decmin,decsec);
            Image1.ImageUrl = "images/constellation/"+cons.TrimEnd()+".png";
            Image1.Visible = Convert.ToBoolean("true");
            reader.Close();
            con.Close();
        }
        DateTime dt = DateTime.Now;
        date.Text = dt.ToString("dd/MM/yyyy"); 
        time.Text = dt.ToString("HH:mm");
   }


    protected void reset_Click(object sender, EventArgs e)
    {
        name.Text = "";
        constellation.Text = "";
        ra.Text = "";
        dect.Text = "";
        time.Text = "";
        date.Text = "";
        latt.Text = "";
        longt.Text = "";
        result.Text = "";
        city.Text = "";
        Image1.Visible = Convert.ToBoolean("false");
        Image1.ImageUrl = "#";
    }

    protected void submit_Click1(object sender, EventArgs e)
    {
        D = Convert.ToInt32(date.Text.Substring(0,2));
        m = Convert.ToInt32(date.Text.Substring(3,2));
        y = Convert.ToInt32(date.Text.Substring(6,4));
        h = Convert.ToInt32(time.Text.Substring(0, 2));
        min = Convert.ToDouble(time.Text.Substring(3, 2));
        lat = Convert.ToDouble(latt.Text);
        lg = Convert.ToDouble(longt.Text);
        t = (lg * 24) / 360;
        hc = (int)t;
        mcm = (t - hc) * 60;
        mc = (int)mcm;
        ay=(hc*60)+mc;
        af=(h*60)+min;
        aq=(af-ay)/60;
        if(aq<0)
        {
            aq=24+aq;
        }
        h=(int)aq;
        sd=aq-h;
        min=sd*60;
        dwhole = (double)(367 * y - (int)(7 * (y + (int)((m + 9) / 12)) / 4) + (int)(275 * m / 9) + D - 730531.5);
        dfrac = (double)(h + (min / 60)) / 24;
        Console.Write(dec);
        Console.Write(lat);
        d = dwhole + dfrac;
        GMST = (double)(280.46061837 + 360.98564736629 * d);
        w = (int)GMST;
        r = (double)GMST - w;
        GMST = w % 360;
        GMST = GMST + r;
        O = (double)(125.04 - 0.052954 * d);
        L = (double)(280.47 + 0.98565 * d);
        dw = (double)(-0.000319 * Math.Sin(O) - 0.000024 * Math.Sin(2 * L));
        es = (double)(23.4393 - 0.0000004 * d);
        eqeq = (double)(dw * Math.Cos(es));
        GAST = GMST + eqeq;
        LST = GAST + lg;
        w = (int)LST;
        r = (double)LST - w;
        LST = w % 360;
        LST = LST + r;// +5;//prerak & ankit ka ashirwad
        LST = (LST * 24) / 360;
        r = (rah) + (ram / 60);
        Console.Write(LST);
        Console.Write("\n");
        Console.Write(r);
        Console.Write("\n");
        if (r < LST)
        {
            di = LST - r;
            if (di > 6)
            {
                result.Text += "star is not visible at this time " + Environment.NewLine;
            }
            else
            {
                dig = (di * 15);
                result.Text+=dig;
                result.Text += " degrees to the west" + Environment.NewLine;
            }
         }

        else if (r > LST)
        {
            di = r - LST;
            if (di > 6)
            {
                result.Text += " star is not visible at this time" + Environment.NewLine;
            }
            else
            {
                dig = (15 * di);
                result.Text+=dig;
                result.Text += " degrees to the east" + Environment.NewLine;
            }
          }

        else
        {
            result.Text += " star is directly overhead" + Environment.NewLine;
        }

        if (dec < lat)
        {
            digr = 90 - (lat - dec);
            result.Text +=digr;
            result.Text+=" degrees to the south"+Environment.NewLine;
        }

        else
        {
            digr = 90 - (dec - lat);
            result.Text+=digr;
            result.Text += " degrees to the north"+Environment.NewLine;
        }
      }

  
    protected double convert(double decdeg, double decmin, double decsec)
    {
        int flag = 0;
        if (decdeg == 0)
        {
            if (decmin < 0)
            {
                decdeg = decdeg * -1;
                flag = 1;
            }
        }

        else if (decdeg < 0)
        {
            decdeg = decdeg * -1;
            flag = 1;
        }

        double a = decdeg * 3600;
        double b = decmin * 60;
        double c = (a + b + decsec) / 3600;

        if (flag == 1)
            return c * -1;
        else
            return c;
    }

    [System.Web.Services.WebMethodAttribute(),
System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] AutoCompletionList
    (string prefixText, int count, string contextKey)
    {
      
        SqlCommand cmd;
        string cmdString =
        "Select Name from catalog WHERE Name LIKE '" +
        prefixText + "%' order by Name asc";
        
        SqlConnection conn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=star;Integrated Security=True");
        conn.Open();
        //         Put this string on one line in your code
        cmd = new SqlCommand(cmdString, conn);
        SqlDataReader myReader;
        List<string> returnData = new List<string>();
        myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        while (myReader.Read())
        {
            returnData.Add(myReader["Name"].ToString());
        }
        if(returnData.Count==0)
        {

            returnData.Add("No results");
        }
        return returnData.ToArray();
    }

    
}
    