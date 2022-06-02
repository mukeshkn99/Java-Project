package application;


import org.supercsv.cellprocessor.CellProcessorAdaptor;
import org.supercsv.cellprocessor.ift.CellProcessor;
import org.supercsv.util.CsvContext;

public class processor extends CellProcessorAdaptor {
	 
	    public processor() {
	        super();
	    }
	 
	    public processor(CellProcessor next) {
	        super(next);
	    }
	 
	    @Override
	    public Object execute(Object value, CsvContext context) {
	        return String.valueOf((String) value);
	    }

	
	}



