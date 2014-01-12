module ApplicationHelper
  
  def debtType(input)
    
    if input == 1
      "Borrow"
    elsif input == 2
      "Lend"  
    else 
    
    end
  end
  
  def debtStat(input)
    if input == 1
      "Outstanding"
    elsif input ==2
      "Paid"
    else
      'Error!'
    end
  end
  


end

