def consolidate_cart(cart)
  newList = {}
  
  cart.each do |itemA|
    itemA.each do |itemB,valA|
      if newList[itemB] != nil
        newList[itemB][:count] += 1
      else
        newList[itemB] = valA
        newList[itemB][:count] = 1
      end
    end
  end
  
  return newList
end

def apply_coupons(cart, coupons)
  
  newListA = cart
  
  coupons.each do |itemA|
    binding.pry
    itemName = itemA[1]
    
    if newListA[itemName] != nil &&  newListA[itemName][:count] > coupons[:num]
      tempVal = newListA[itemName][:count] / coupons[:num]
      newListA[itemName][:count] -= coupons[:num]
      tempKey = "#{itemName} W/COUPON"
      tempItem = {tempKey => {:price => coupons[:cost], :clearence => newListA[itemName][:clearance], :count => tempVal}}
      
      if newListA[tempKey] == nil
        newListA.merge!(tempItem)
      end       
    end
  end
     
  return newListA
  
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
