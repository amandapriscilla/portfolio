namespace SIDAF.UI.FILIAL.Relatorio
{
    partial class frmInformacoesCaixa
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.lblFuncionario = new System.Windows.Forms.Label();
            this.cmbBoxFuncionario = new System.Windows.Forms.ComboBox();
            this.lblFilial = new System.Windows.Forms.Label();
            this.cmbBoxFilial = new System.Windows.Forms.ComboBox();
            this.lblData = new System.Windows.Forms.Label();
            this.mTBoxData = new System.Windows.Forms.MaskedTextBox();
            this.btnGerarRelCaixa = new System.Windows.Forms.Button();
            this.gBoxInfoCaixa = new System.Windows.Forms.GroupBox();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.IdCaixa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Filial = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Funcionario = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.HoraAbertura = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.HoraFechamento = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Estornos = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ValorAbertura = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ValorFechamento = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupBox1.SuspendLayout();
            this.gBoxInfoCaixa.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnGerarRelCaixa);
            this.groupBox1.Controls.Add(this.mTBoxData);
            this.groupBox1.Controls.Add(this.lblData);
            this.groupBox1.Controls.Add(this.cmbBoxFilial);
            this.groupBox1.Controls.Add(this.lblFilial);
            this.groupBox1.Controls.Add(this.cmbBoxFuncionario);
            this.groupBox1.Controls.Add(this.lblFuncionario);
            this.groupBox1.Location = new System.Drawing.Point(2, 2);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(757, 100);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Relatório Informações do Caixa";
            // 
            // lblFuncionario
            // 
            this.lblFuncionario.AutoSize = true;
            this.lblFuncionario.Location = new System.Drawing.Point(10, 70);
            this.lblFuncionario.Name = "lblFuncionario";
            this.lblFuncionario.Size = new System.Drawing.Size(62, 13);
            this.lblFuncionario.TabIndex = 0;
            this.lblFuncionario.Text = "Funcionário";
            // 
            // cmbBoxFuncionario
            // 
            this.cmbBoxFuncionario.FormattingEnabled = true;
            this.cmbBoxFuncionario.Location = new System.Drawing.Point(77, 65);
            this.cmbBoxFuncionario.Name = "cmbBoxFuncionario";
            this.cmbBoxFuncionario.Size = new System.Drawing.Size(121, 21);
            this.cmbBoxFuncionario.TabIndex = 1;
            // 
            // lblFilial
            // 
            this.lblFilial.AutoSize = true;
            this.lblFilial.Location = new System.Drawing.Point(10, 35);
            this.lblFilial.Name = "lblFilial";
            this.lblFilial.Size = new System.Drawing.Size(27, 13);
            this.lblFilial.TabIndex = 2;
            this.lblFilial.Text = "Filial";
            // 
            // cmbBoxFilial
            // 
            this.cmbBoxFilial.FormattingEnabled = true;
            this.cmbBoxFilial.Location = new System.Drawing.Point(77, 32);
            this.cmbBoxFilial.Name = "cmbBoxFilial";
            this.cmbBoxFilial.Size = new System.Drawing.Size(121, 21);
            this.cmbBoxFilial.TabIndex = 3;
            // 
            // lblData
            // 
            this.lblData.AutoSize = true;
            this.lblData.Location = new System.Drawing.Point(280, 40);
            this.lblData.Name = "lblData";
            this.lblData.Size = new System.Drawing.Size(30, 13);
            this.lblData.TabIndex = 4;
            this.lblData.Text = "Data";
            // 
            // mTBoxData
            // 
            this.mTBoxData.Location = new System.Drawing.Point(327, 35);
            this.mTBoxData.Mask = "00/00/0000";
            this.mTBoxData.Name = "mTBoxData";
            this.mTBoxData.Size = new System.Drawing.Size(70, 20);
            this.mTBoxData.TabIndex = 5;
            this.mTBoxData.ValidatingType = typeof(System.DateTime);
            // 
            // btnGerarRelCaixa
            // 
            this.btnGerarRelCaixa.Location = new System.Drawing.Point(501, 49);
            this.btnGerarRelCaixa.Name = "btnGerarRelCaixa";
            this.btnGerarRelCaixa.Size = new System.Drawing.Size(75, 23);
            this.btnGerarRelCaixa.TabIndex = 6;
            this.btnGerarRelCaixa.Text = "Gerar";
            this.btnGerarRelCaixa.UseVisualStyleBackColor = true;
            // 
            // gBoxInfoCaixa
            // 
            this.gBoxInfoCaixa.Controls.Add(this.dataGridView1);
            this.gBoxInfoCaixa.Location = new System.Drawing.Point(2, 108);
            this.gBoxInfoCaixa.Name = "gBoxInfoCaixa";
            this.gBoxInfoCaixa.Size = new System.Drawing.Size(757, 229);
            this.gBoxInfoCaixa.TabIndex = 1;
            this.gBoxInfoCaixa.TabStop = false;
            this.gBoxInfoCaixa.Text = "Resultado da Busca";
            // 
            // dataGridView1
            // 
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.IdCaixa,
            this.Filial,
            this.Funcionario,
            this.HoraAbertura,
            this.HoraFechamento,
            this.Estornos,
            this.ValorAbertura,
            this.ValorFechamento});
            this.dataGridView1.Location = new System.Drawing.Point(1, 19);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders;
            this.dataGridView1.Size = new System.Drawing.Size(751, 210);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // IdCaixa
            // 
            this.IdCaixa.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader;
            this.IdCaixa.HeaderText = "IdCaixa";
            this.IdCaixa.Name = "IdCaixa";
            this.IdCaixa.Width = 67;
            // 
            // Filial
            // 
            this.Filial.HeaderText = "Filial";
            this.Filial.Name = "Filial";
            // 
            // Funcionario
            // 
            this.Funcionario.HeaderText = "Funcionario";
            this.Funcionario.Name = "Funcionario";
            // 
            // HoraAbertura
            // 
            this.HoraAbertura.HeaderText = "Hora Abertura";
            this.HoraAbertura.Name = "HoraAbertura";
            // 
            // HoraFechamento
            // 
            this.HoraFechamento.HeaderText = "Hora Fechamento";
            this.HoraFechamento.Name = "HoraFechamento";
            // 
            // Estornos
            // 
            this.Estornos.HeaderText = "Estornos";
            this.Estornos.Name = "Estornos";
            // 
            // ValorAbertura
            // 
            this.ValorAbertura.HeaderText = "ValorAbertura";
            this.ValorAbertura.Name = "ValorAbertura";
            // 
            // ValorFechamento
            // 
            this.ValorFechamento.HeaderText = "ValorFechamento";
            this.ValorFechamento.Name = "ValorFechamento";
            // 
            // frmInformacoesCaixa
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(766, 342);
            this.Controls.Add(this.gBoxInfoCaixa);
            this.Controls.Add(this.groupBox1);
            this.Name = "frmInformacoesCaixa";
            this.Text = "frmInformacoesCaixa";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.gBoxInfoCaixa.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.MaskedTextBox mTBoxData;
        private System.Windows.Forms.Label lblData;
        private System.Windows.Forms.ComboBox cmbBoxFilial;
        private System.Windows.Forms.Label lblFilial;
        private System.Windows.Forms.ComboBox cmbBoxFuncionario;
        private System.Windows.Forms.Label lblFuncionario;
        private System.Windows.Forms.Button btnGerarRelCaixa;
        private System.Windows.Forms.GroupBox gBoxInfoCaixa;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridViewTextBoxColumn IdCaixa;
        private System.Windows.Forms.DataGridViewTextBoxColumn Filial;
        private System.Windows.Forms.DataGridViewTextBoxColumn Funcionario;
        private System.Windows.Forms.DataGridViewTextBoxColumn HoraAbertura;
        private System.Windows.Forms.DataGridViewTextBoxColumn HoraFechamento;
        private System.Windows.Forms.DataGridViewTextBoxColumn Estornos;
        private System.Windows.Forms.DataGridViewTextBoxColumn ValorAbertura;
        private System.Windows.Forms.DataGridViewTextBoxColumn ValorFechamento;
    }
}