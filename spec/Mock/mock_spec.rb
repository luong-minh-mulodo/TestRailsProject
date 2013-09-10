#require 'rspec/mocks/standalone'

class Person  
  name
  
end


describe Person do
    it "Mock" do
      
      #double object
      person = double(Person)
      
      #stub method     
      person.stub(:name) {'Minh'}
         
      person.stub(:name => 'Minh')
      
      allow(person).to receive(:name).and_return("Tam")
      
      
      #fake method
      allow(person).to receive(:message) do |arg1,arg2|
        expect(arg1).to have_text("a")
        return "b"
      end
      
  
    end
end