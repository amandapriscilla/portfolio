namespace SIDAF.UI.FILIAL.Relatorio
{
    partial class frmExibirRelatorios
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
            this.gBoxHistVendas = new System.Windows.Forms.GroupBox();
            this.lblDataInicio = new System.Windows.Forms.Label();
            this.lblDataFim = new System.Windows.Forms.Label();
            this.mTBoxInicio = new System.Windows.Forms.MaskedTextBox();
            this.mTBoxFim = new System.Windows.Forms.MaskedTextBox();
            this.lblFilial = new System.Windows.Forms.Label();
            this.cmbBoxFilial = new System.Windows.Forms.ComboBox();
            this.dgvRelVendas = new System.Windows.Forms.DataGridView();
            this.Data = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Produto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Quantidade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Preço_Venda = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Total = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnGerar = new System.Windows.Forms.Button();
            this.gBoxHistVendas.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvRelVendas)).BeginInit();
            this.SuspendLayout();
            // 
            // gBoxHistVendas
            // 
            this.gBoxHistVendas.Controls.Add(this.btnGerar);
            this.gBoxHistVendas.Controls.Add(this.cmbBoxFilial);
            this.gBoxHistVendas.Controls.Add(this.lblFilial);
            this.gBoxHistVendas.Controls.Add(this.mTBoxFim);
            this.gBoxHistVendas.Controls.Add(this.mTBoxInicio);
            this.gBoxHistVendas.Controls.Add(this.lblDataFim);
            this.gBoxHistVendas.Controls.Add(this.lblDataInicio);
            this.gBoxHistVendas.Location = new System.Drawing.Point(1, 2);
            this.gBoxHistVendas.Name = "gBoxHistVendas";
            this.gBoxHistVendas.Size = new System.Drawing.Size(513, 111);
            this.gBoxHistVendas.TabIndex = 0;
            this.gBoxHistVendas.TabStop = false;
            this.gBoxHistVendas.Text = "Relatório Histórico de Vendas";
            // 
            // lblDataInicio
            // 
            this.lblDataInicio.AutoSize = true;
            this.lblDataInicio.Location = new System.Drawing.Point(239, 37);
            this.lblDataInicio.Name = "lblDataInicio";
            this.lblDataInicio.Size = new System.Drawing.Size(60, 13);
            this.lblDataInicio.TabIndex = 0;
            this.lblDataInicio.Text = "Data Inicial";
            // 
            // lblDataFim
            // 
            this.lblDataFim.AutoSize = true;
            this.lblDataFim.Location = new System.Drawing.Point(239, 72);
            this.lblDataFim.Name = "lblDataFim";
            this.lblDataFim.Size = new System.Drawing.Size(55, 13);
            this.lblDataFim.TabIndex = 1;
            this.lblDataFim.Text = "Data Final";
            // 
            // mTBoxInicio
            // 
            this.mTBoxInicio.Location = new System.Drawing.Point(305, 30);
            this.mTBoxInicio.Mask = "00/00/0000";
            this.mTBoxInicio.Name = "mTBoxInicio";
            this.mTBoxInicio.Size = new System.Drawing.Size(73, 20);
            this.mTBoxInicio.TabIndex = 2;
            this.mTBoxInicio.ValidatingType = typeof(System.DateTime);
            // 
            // mTBoxFim
            // 
            this.mTBoxFim.Location = new System.Drawing.Point(305, 65);
            this.mTBoxFim.Mask = "00/00/0000";
            this.mTBoxFim.Name = "mTBoxFim";
            this.mTBoxFim.Size = new System.Drawing.Size(73, 20);
            this.mTBoxFim.TabIndex = 3;
            this.mTBoxFim.ValidatingType = typeof(System.DateTime);
            // 
            // lblFilial
            // 
            this.lblFilial.AutoSize = true;
            this.lblFilial.Location = new System.Drawing.Point(21, 42);
            this.lblFilial.Name = "lblFilial";
            this.lblFilial.Size = new System.Drawing.Size(27, 13);
            this.lblFilial.TabIndex = 4;
            this.lblFilial.Text = "Filial";
            // 
            // cmbBoxFilial
            // 
            this.cmbBoxFilial.FormattingEnabled = true;
            this.cmbBoxFilial.Items.AddRange(new object[] {
            "Nova Cruz",
            "Santa Cruz",
            "Natal",
            "Canguaretama"});
            this.cmbBoxFilial.Location = new System.Drawing.Point(54, 34);
            this.cmbBoxFilial.Name = "cmbBoxFilial";
            this.cmbBoxFilial.Size = new System.Drawing.Size(121, 21);
            this.cmbBoxFilial.TabIndex = 5;
            // 
            // dgvRelVendas
            // 
            this.dgvRelVendas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvRelVendas.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Data,
            this.Produto,
            this.Quantidade,
            this.Preço_Venda,
            this.Total});
            this.dgvRelVendas.Location = new System.Drawing.Point(1, 119);
            this.dgvRelVendas.Name = "dgvRelVendas";
            this.dgvRelVendas.Size = new System.Drawing.Size(513, 211);
            this.dgvRelVendas.TabIndex = 1;
            // 
            // Data
            // 
            this.Data.HeaderText = "Data";
            this.Data.Name = "Data";
            // 
            // Produto
            // 
            this.Produto.HeaderText = "Produto";
            this.Produto.Name = "Produto";
            // 
            // Quantidade
            // 
            this.Quantidade.HeaderText = "Quantidade";
            this.Quantidade.Name = "Quantidade";
            // 
            // Preço_Venda
            // 
            this.Preço_Venda.HeaderText = "Preço Venda";
            this.Preço_Venda.Name = "Preço_Venda";
            // 
            // Total
            // 
            this.Total.HeaderText = "Total";
            this.Total.Name = "Total";
            // 
            // btnGerar
            // 
            this.btnGerar.Location = new System.Drawing.Point(417, 53);
            this.btnGerar.Name = "btnGerar";
            this.btnGerar.Size = new System.Drawing.Size(75, 23);
            this.btnGerar.TabIndex = 6;
            this.btnGerar.Text = "Gerar";
            this.btnGerar.UseVisualStyleBackColor = true;
            // 
            // frmExibirRelatorios
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(515, 342);
            this.Controls.Add(this.dgvRelVendas);
            this.Controls.Add(this.gBoxHistVendas);
            this.Name = "frmExibirRelatorios";
            this.Text = "frmExibirRelatorios";
            this.gBoxHistVendas.ResumeLayout(false);
            this.gBoxHistVendas.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvRelVendas)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gBoxHistVendas;
        private System.Windows.Forms.Label lblFilial;
        private System.Windows.Forms.MaskedTextBox mTBoxFim;
        private System.Windows.Forms.MaskedTextBox mTBoxInicio;
        private System.Windows.Forms.Label lblDataFim;
        private System.Windows.Forms.Label lblDataInicio;
        private System.Windows.Forms.ComboBox cmbBoxFilial;
        private System.Windows.Forms.DataGridView dgvRelVendas;
        private System.Windows.Forms.Button btnGerar;
        private System.Windows.Forms.DataGridViewTextBoxColumn Data;
        private System.Windows.Forms.DataGridViewTextBoxColumn Produto;
        private System.Windows.Forms.DataGridViewTextBoxColumn Quantidade;
        private System.Windows.Forms.DataGridViewTextBoxColumn Preço_Venda;
        private System.Windows.Forms.DataGridViewTextBoxColumn Total;
    }
}