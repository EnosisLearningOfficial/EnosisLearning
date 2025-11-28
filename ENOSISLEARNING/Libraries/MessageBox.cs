using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;
using System.Collections;

namespace ENOSISLEARNING
{
    public class MessageBoxNew
    {
        #region data members

        private readonly string strLine;
        private readonly StringBuilder msgbox;
        private readonly StreamReader readtemplte;

        private string msgboxTitle = "";
        private string msgboxIcon = "";
        private string msgboxMessage = "";
        private string msgboxOkButton = "";
        private string msgboxButtons = "";
        private readonly ArrayList msgboxButton;

        #endregion

        #region constructors

        public MessageBoxNew(string tplPath)
        {
            readtemplte = new StreamReader(tplPath);
            msgbox = new StringBuilder();
            msgboxButton = new ArrayList();
            while ((strLine = readtemplte.ReadLine()) != null)
            {
                msgbox.Append(strLine);
            }

        }

        #endregion

        #region methods

        public void SetTitle(string msgTitle)
        {
            msgboxTitle = msgTitle;
        }
        public void SetIcon(string msgIcon)
        {
            msgboxIcon = "<img src=\"Images/" + msgIcon + "\">";
        }
        public void SetMessage(string msgMessage)
        {
            msgboxMessage = "<strong>" + msgMessage + "<strong>";
        }
        public void SetOKButton(string msgButtonClass)
        {
            msgboxOkButton = "<input type=\"button\" id=\"btnOK\" autofocus value=\"OK\" class=\"" + msgButtonClass + "\" onClick=\"document.getElementById('pagedimmer').style.visibility = 'hidden'; document.getElementById('msgbox').style.visibility = 'hidden';\">";
        }

        public string ReturnObject()
        {
            var i = 0;

            while (i < msgboxButton.Count)
            {
                msgboxButtons += msgboxButton[i] + "&nbsp;";
                i++;
            }

            msgbox.Replace("[TITLE]", msgboxTitle);
            msgbox.Replace("[ICON]", msgboxIcon);
            msgbox.Replace("[MESSAGE]", msgboxMessage);
            msgbox.Replace("[BUTTONS]", msgboxButtons + msgboxOkButton);
            return msgbox.ToString();
        }

        #endregion
    }

    public class MessageBox
    {
        #region data members

        private readonly string strLine;
        private readonly StringBuilder msgbox;
        private readonly StreamReader readtemplte;

        private string msgboxTitle = "";
        private string msgboxIcon = "";
        private string msgboxMessage = "";
        private string msgboxOkButton = "";
        private string msgboxButtons = "";
        //private string setFocus = "";
        private readonly ArrayList msgboxButton;

        #endregion

        #region constructors

        public MessageBox(string tplPath)
        {
            readtemplte = new StreamReader(tplPath);
            msgbox = new StringBuilder();
            msgboxButton = new ArrayList();
            while ((strLine = readtemplte.ReadLine()) != null)
            {
                msgbox.Append(strLine);
            }

        }

        #endregion

        #region methods

        public void SetTitle(string msgTitle)
        {
            msgboxTitle = msgTitle;
        }
        public void SetIcon(string msgIcon)
        {
            msgboxIcon = "<img src=\"Images/" + msgIcon + "\">";
        }
        public void SetMessage(string msgMessage)
        {
            msgboxMessage = "<strong>" + msgMessage + "<strong>";
        }
        public void SetOKButton(string msgButtonClass)
        {
            // this.msgbox_ok_button = "<input type=\"button\" id=\"btnOK\" value=\"OK\" TabStop=\"false\" tabindex=\"-1\" autofocus=\"autofocus\" class=\"" + msg_button_class + "\" onClick=\"document.getElementById('pagedimmer').style.visibility = 'hidden'; document.getElementById('msgbox').style.visibility = 'hidden';\">";
            msgboxOkButton = "<input type=\"button\" id=\"btnOK\" autofocus value=\"OK\" class=\"" + msgButtonClass + "\" onClick=\"document.getElementById('pagedimmer').style.visibility = 'hidden'; document.getElementById('msgbox').style.visibility = 'hidden';\">";
        }

        public string ReturnObject()
        {
            var i = 0;

            while (i < msgboxButton.Count)
            {
                msgboxButtons += msgboxButton[i] + "&nbsp;";
                i++;
            }

            msgbox.Replace("[TITLE]", msgboxTitle);
            msgbox.Replace("[ICON]", msgboxIcon);
            msgbox.Replace("[MESSAGE]", msgboxMessage);
            msgbox.Replace("[BUTTONS]", msgboxButtons + msgboxOkButton);
            //sgbox.Append(setFocus);
            return msgbox.ToString();
        }

        #endregion
    }
}