using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SIDAF.UI.FILIAL
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void toolStripSplitButton1_ButtonClick(object sender, EventArgs e)
        {

        }

        private void ribbonButton2_Click(object sender, EventArgs e)
        {
            Gerencia.frmNovoCliente form = new SIDAF.UI.FILIAL.Gerencia.frmNovoCliente();
            form.MdiParent = this;
            form.Show();
        }
    }
}
