
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import weka.core.Instances;


/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author DELL
 */
public class trial {
    
    public static void main(String[] args) throws FileNotFoundException, IOException
    {
         BufferedReader inputReader = null;
            inputReader = new BufferedReader(new FileReader("F:\\Java_mindsript\\breast cancer classification\\web\\breast-cancer-wisconsin.arff"));
            Instances data = new Instances(inputReader);
            data.setClassIndex(data.numAttributes() - 1);
            
       
    }
    
}
