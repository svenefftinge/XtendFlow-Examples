package de.grammarcraft.xtend.flow.examples.convertroman.integration.head

import de.grammarcraft.xtend.flow.examples.convertroman.contracts.IInputProvider
import de.grammarcraft.xtend.flow.examples.convertroman.contracts.IOutputProvider
import de.grammarcraft.xtend.flow.examples.convertroman.operations.DisplayError
import de.grammarcraft.xtend.flow.examples.convertroman.operations.DisplayResult
import de.grammarcraft.xtend.flow.examples.convertroman.operations.ReadNumberToConvert
import de.grammarcraft.xtend.flow.examples.convertroman.integration.body.Body
import static de.grammarcraft.xtend.flow.data.None.None

class Head 
{
    ReadNumberToConvert entry_point
    
    new(IInputProvider input, Body body, IOutputProvider output) 
    {
    	val read_number_to_convert = new ReadNumberToConvert(input)
	    val display_result = new DisplayResult(output)
	    val display_error = new DisplayError(output)
	    val convert = body
	    
	    // setup flow
	    read_number_to_convert.output -> convert
		convert.result -> display_result
		convert.error -> display_error
		
		entry_point = read_number_to_convert
	}
	
	def run() {
	    entry_point <= None
	}
	
}