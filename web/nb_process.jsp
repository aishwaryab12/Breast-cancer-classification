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
    
    
<html>
    <head>
      
        <title>Insert title here</title>
    </head>
    <body bgcolor="#eaeafa">
        <%
            
            BufferedReader inputReader = null;
            inputReader = new BufferedReader(new FileReader("F:\\Java_mindsript\\breast cancer classification\\web\\breast-cancer-wisconsin.arff"));
            Instances data = new Instances(inputReader);
                
                                Remove remove = new Remove();
				
				int removeatt[]={0,9};
				remove.setAttributeIndicesArray(removeatt);
				
				remove.setInputFormat(data);
				Instances newData = Filter.useFilter(data, remove);
				
				//replace missing values by mean
				Filter impute = new ReplaceMissingValues();
		    	impute.setInputFormat(newData);
		    	newData = Filter.useFilter(newData, impute);
		    	
		    	
		    	//discretization of dataset
		    	int m_nNonDiscreteAttribute = -1;
		    	  Enumeration<Attribute> enu = newData.enumerateAttributes();
		    	  while (enu.hasMoreElements()) {
                              
		    	    Attribute attribute = enu.nextElement();
		    	    if (attribute.type() != Attribute.NOMINAL  ) {
		    	      m_nNonDiscreteAttribute = attribute.index();
		    	    }
		    	  }

		    	  if ((m_nNonDiscreteAttribute > -1)
		    	    && (newData.attribute(m_nNonDiscreteAttribute).type() != Attribute.NOMINAL)) {
		    	   Filter m_DiscretizeFilter = new Discretize();
		    	    m_DiscretizeFilter.setInputFormat(newData);
		    	    newData = Filter.useFilter(newData, m_DiscretizeFilter);
		    	  }
				
		    
				//System.out.println(newData.numAttributes() - 1);
				
				
			/*  
				 If you want to apply supervised machine learning and your data set has an attribute, 
				 which you want to predict for unseen observations, your first task should be telling Weka 
				 about the special role of this attribute. 
				 In Weka terms this is called defining it as class attribute. 
				 In Java this can be done simply by following line.
				 * */
				
		        //set which class u want to predict
				newData.setClassIndex(newData.numAttributes() - 1);

            NaiveBayes tree = new NaiveBayes();
                
            Evaluation eval = new Evaluation(newData);
            eval.crossValidateModel(tree, newData, 10, new Random(1));
            //out.println(eval.toSummaryString("\nResults naive bayes\n\n", false));
            out.println();
            //out.println(eval.toClassDetailsString()+"\n\n")
            out.println();
            //out.println(eval.toMatrixString());
                
            String[] s=eval.toSummaryString().split("\n");
            String[] s1=eval.toClassDetailsString().split("\n");
            String[] s2=eval.toMatrixString().split("\n");
                
    %>
        <%=s[0]%><br>
        <%=s[1]%><br>
            
        <%=s[2]%><br>
            
       
        <%=s1[0]%><br>
        <%=s1[1]%><br>
        <%=s1[2]%><br>
        <%=s1[3]%><br>
        <%=s1[4]%><br><br>
        <%=s2[0]%><br>
        <%=s2[1]%><br>
        <%=s2[2]%><br>
        <%=s2[3]%><br>
        <%=s2[4]%><br>
        <%
            
    System.out.println(eval.toSummaryString("\nResults naive bayes\n", false));
    System.out.println(eval.toClassDetailsString()+"\n");
        
    String cMatrix = eval.toMatrixString();
    System.out.println(cMatrix);
        
    //Filter.useFilter(data, remove);
    %>
    </body>
</html>