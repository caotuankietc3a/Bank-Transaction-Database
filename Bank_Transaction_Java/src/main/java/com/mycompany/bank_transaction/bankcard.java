/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JInternalFrame.java to edit this template
 */
package com.mycompany.bank_transaction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author caparies
 */
public class bankcard extends javax.swing.JInternalFrame {

    /**
     * Creates new form customer
     */
    public bankcard() {
        initComponents();
        autoID();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    
    Connection con;
    PreparedStatement insert;
    ResultSet rs;
    
    public void autoID(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_transaction?sessionVariables=sql_mode='NO_ENGINE_SUBSTITUTION'&jdbcCompliantTruncation=false","root","hokgadau123");
            
            
            Statement s = con.createStatement();
            
            ResultSet rs = s.executeQuery("select Max(C_ID) from BankCard");
            rs.next();
            rs.getString("Max(C_ID)");
            
            if(rs.getString("Max(C_ID)") == null){
                cardnum.setText("100000");
            }
            else
            {
                long id = Long.parseLong(rs.getString("Max(C_ID)").substring(2, rs.getString("Max(C_ID)").length()));
                id ++;
                
                cusid.setText("100" + String.format("%03d", id));
            }
            
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(bankcard.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(bankcard.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        sdate = new javax.swing.JTextField();
        cardnum = new javax.swing.JTextField();
        edate = new javax.swing.JTextField();
        cusid = new javax.swing.JTextField();
        accnum = new javax.swing.JTextField();
        addbutton = new javax.swing.JButton();
        cancelbutton = new javax.swing.JButton();
        findbutton = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();

        jLabel2.setFont(new java.awt.Font("Hack Nerd Font", 1, 18)); // NOI18N
        jLabel2.setText("Card Number");

        jLabel3.setFont(new java.awt.Font("Hack Nerd Font", 1, 18)); // NOI18N
        jLabel3.setText("Start Date");

        jLabel4.setFont(new java.awt.Font("Hack Nerd Font", 1, 18)); // NOI18N
        jLabel4.setText("Expired Date");

        jLabel5.setFont(new java.awt.Font("Hack Nerd Font", 1, 18)); // NOI18N
        jLabel5.setText("Account Number");

        jLabel6.setFont(new java.awt.Font("Hack Nerd Font", 1, 18)); // NOI18N
        jLabel6.setText("Customer ID");

        cardnum.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cardnumActionPerformed(evt);
            }
        });

        cusid.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cusidActionPerformed(evt);
            }
        });

        accnum.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                accnumActionPerformed(evt);
            }
        });

        addbutton.setFont(new java.awt.Font("Hack Nerd Font", 1, 18)); // NOI18N
        addbutton.setText("Add");
        addbutton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                addbuttonActionPerformed(evt);
            }
        });

        cancelbutton.setFont(new java.awt.Font("Hack Nerd Font", 1, 18)); // NOI18N
        cancelbutton.setText("Cancel");
        cancelbutton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelbuttonActionPerformed(evt);
            }
        });

        findbutton.setFont(new java.awt.Font("Hack Nerd Font", 1, 18)); // NOI18N
        findbutton.setText("Find");
        findbutton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                findbuttonActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3)
                            .addComponent(jLabel2)
                            .addComponent(jLabel6)
                            .addComponent(jLabel4)
                            .addComponent(jLabel5)))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(72, 72, 72)
                        .addComponent(addbutton, javax.swing.GroupLayout.PREFERRED_SIZE, 76, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(136, 136, 136)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(findbutton, javax.swing.GroupLayout.PREFERRED_SIZE, 76, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(134, 134, 134)
                        .addComponent(cancelbutton)
                        .addGap(58, 58, 58))
                    .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                        .addComponent(sdate, javax.swing.GroupLayout.DEFAULT_SIZE, 356, Short.MAX_VALUE)
                        .addComponent(cardnum)
                        .addComponent(accnum)
                        .addComponent(edate)
                        .addComponent(cusid)))
                .addContainerGap(27, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel2)
                            .addComponent(cardnum, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(53, 53, 53)
                        .addComponent(jLabel3))
                    .addComponent(sdate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(62, 62, 62)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel4)
                    .addComponent(edate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(79, 79, 79)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel5)
                    .addComponent(accnum, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(83, 83, 83)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel6)
                    .addComponent(cusid, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(46, 46, 46)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(addbutton, javax.swing.GroupLayout.PREFERRED_SIZE, 69, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(findbutton, javax.swing.GroupLayout.PREFERRED_SIZE, 69, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(cancelbutton, javax.swing.GroupLayout.PREFERRED_SIZE, 69, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(30, Short.MAX_VALUE))
        );

        jLabel1.setFont(new java.awt.Font("Hack Nerd Font", 1, 36)); // NOI18N
        jLabel1.setText("Bank Card");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(41, 41, 41)
                        .addComponent(jLabel1))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(28, 28, 28)
                        .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap(24, Short.MAX_VALUE)
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void findbuttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_findbuttonActionPerformed
        try {
            // TODO add your handling code here:
            
            String cus_id = cusid.getText();
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_transaction?sessionVariables=sql_mode='NO_ENGINE_SUBSTITUTION'&jdbcCompliantTruncation=false","root","hokgadau123");
        
            insert = con.prepareStatement("select * from BankCard where C_ID = ?");
            insert.setString(1, cus_id);
            rs = insert.executeQuery();
            
            
            if(rs.next() == false){
                JOptionPane.showMessageDialog(this, "Not found!!!!");
            }
            else
            {
                String card_num = rs.getString("CardNum");
                cardnum.setText(card_num.trim());
                
                String s_date = rs.getString("StartDate");
                sdate.setText(s_date.trim());
                
                String ex_date = rs.getString("ExpDate");
                edate.setText(ex_date.trim());
                
                String acc_num = rs.getString("AccNum");
                accnum.setText(acc_num.trim());
            }
            
            
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(bankcard.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(bankcard.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_findbuttonActionPerformed

    private void cancelbuttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelbuttonActionPerformed
        // TODO add your handling code here:
        setVisible(false);
        dispose();
    }//GEN-LAST:event_cancelbuttonActionPerformed

    private void addbuttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_addbuttonActionPerformed
        try {
            // TODO add your handling code here:

            String card_num = cardnum.getText();
            String s_date = sdate.getText();
            String ex_date = edate.getText();
            String cus_id = cusid.getText();
            String acc_num = accnum.getText();

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_transaction?sessionVariables=sql_mode='NO_ENGINE_SUBSTITUTION'&jdbcCompliantTruncation=false","root","hokgadau123");

            insert = con.prepareStatement("insert into BankCard(CardNum, StartDate, ExpDate, AccNum, C_ID) values (?,?,?,?,?)");
            insert.setString(1, card_num);
            insert.setString(2, s_date);
            insert.setString(3, ex_date);
            insert.setString(4, acc_num);
            insert.setString(5, cus_id);
            insert.executeUpdate();

            JOptionPane.showMessageDialog(this, "Adding successfully!!!");

            cardnum.setText("");
            sdate.setText("");
            edate.setText("");
            accnum.setText("");
            autoID();


        } catch (ClassNotFoundException ex) {
            Logger.getLogger(bankcard.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(bankcard.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_addbuttonActionPerformed

    private void accnumActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_accnumActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_accnumActionPerformed

    private void cusidActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cusidActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cusidActionPerformed

    private void cardnumActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cardnumActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cardnumActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTextField accnum;
    private javax.swing.JButton addbutton;
    private javax.swing.JButton cancelbutton;
    private javax.swing.JTextField cardnum;
    private javax.swing.JTextField cusid;
    private javax.swing.JTextField edate;
    private javax.swing.JButton findbutton;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JTextField sdate;
    // End of variables declaration//GEN-END:variables
}
