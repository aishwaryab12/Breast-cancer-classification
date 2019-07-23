<%-- 
    Document   : sactter
    Created on : 24 Oct, 2018, 2:25:23 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="weka.classifiers.bayes.NaiveBayes"%>
<%@page import="weka.filters.unsupervised.attribute.Normalize"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.NormalAnnotation"%>
<%@page import="weka.filters.Filter"%>
<%@page import="weka.filters.unsupervised.attribute.Remove"%>
<%@page import="weka.filters.unsupervised.attribute.Discretize"%>
<%@page import="weka.filters.unsupervised.attribute.ReplaceMissingValues"%>
<%@page import="weka.gui.treevisualizer.PlaceNode2"%>
<%@page import="weka.gui.treevisualizer.TreeVisualizer"%>
<%@page import="weka.gui.visualize.MatrixPanel"%>
<%@page import="weka.core.*"%>
<%@page import="java.io.FileReader"%>
<%@page import = "java.awt.BorderLayout" %>>
<%@page import = "java.io.BufferedReader" %>
<%@page import = "java.util.*" %>
<%@page import = "weka.classifiers.*" %>

<%@page import = "weka.filters.*" %>
<%@page import = "weka.gui.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            BufferedReader inputReader = null;
	inputReader = new BufferedReader(new FileReader("F:\\Java_mindsript\\breast cancer classification\\web\\breast-cancer-wisconsin.arff"));
	Instances newData = new Instances(inputReader);

	Remove remove = new Remove();
				
				//int removeatt[]={0,9};
				//remove.setAttributeIndicesArray(removeatt);
				
				//remove.setInputFormat(data);
				//Instances newData = Filter.useFilter(data, remove);
				
				//replace missing values by mean
				Filter impute = new ReplaceMissingValues();
		    	impute.setInputFormat(newData);
		    	newData = Filter.useFilter(newData, impute);
		    	
		    	
		    	//discretization of dataset
		    	int m_nNonDiscreteAttribute = -1;
		    	  Enumeration<Attribute> enu = newData.enumerateAttributes();
		    	  while (enu.hasMoreElements()) {
		    	    Attribute attribute = enu.nextElement();
		    	    if (attribute.type() != Attribute.NOMINAL) {
		    	      m_nNonDiscreteAttribute = attribute.index();
		    	    }
		    	  }

		    	  if ((m_nNonDiscreteAttribute > -1)
		    	    && (newData.attribute(m_nNonDiscreteAttribute).type() != Attribute.NOMINAL)) {
		    	   Filter m_DiscretizeFilter = new Discretize();
		    	    m_DiscretizeFilter.setInputFormat(newData);
		    	    newData = Filter.useFilter(newData, m_DiscretizeFilter);
		    	  }
				
		    	
				//System.out.println(newData);
				
				
			/*  
				 If you want to apply supervised machine learning and your data set has an attribute, 
				 which you want to predict for unseen observations, your first task should be telling Weka 
				 about the special role of this attribute. 
				 In Weka terms this is called defining it as class attribute. 
				 In Java this can be done simply by following line.
				 * */
				
		        //set which class u want to predict
				newData.setClassIndex(newData.numAttributes() - 1);
                                
                                if (newData != null) {
		    MatrixPanel mp = new MatrixPanel();
		    mp.setInstances(newData);
		    String plotName = newData.relationName();
		    final javax.swing.JFrame jf = new javax.swing.JFrame(
		      "Weka Attribute Selection Visualize: " + plotName);
		    jf.setSize(800, 600);
		    jf.getContentPane().setLayout(new BorderLayout());
		    jf.getContentPane().add(mp, BorderLayout.CENTER);
		    jf.addWindowListener(new java.awt.event.WindowAdapter() {
		      @Override
		      public void windowClosing(java.awt.event.WindowEvent e) {
		        jf.dispose();
		      }
		    });

		    jf.setVisible(true);
		  }


        
        %>
    </body>
</html>
