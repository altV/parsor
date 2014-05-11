require_relative 'parsor'

describe Parsor do

  describe 'chars' do
    example do
      Parsor.get("Hello world oh world...") do
        char 'o'
      end.should == ''
    end

    example do
      Parsor.get("Hello world oh world...") do
        char 'H'
      end.should == 'H'
    end

    example do
      Parsor.get("Hello world oh world...") do
        char 'H'
        char 'o'
      end.should == ''
    end
  end

  describe 'strings' do
    example do
      Parsor.get("Hello world oh world...") do
        string 'Hello'
      end.should == 'Hello'
    end

    example do
      Parsor.get("Hello world oh world...") do
        string 'Hel o'
      end.should == ''
    end
  end

  describe 'combinators' do
    example do
      Parsor.get("Hello world oh world...") do
        char 'H'
        char 'e'
        many do
          char 'l'
        end
        char 'o'
      end.should == 'Hello'
    end

    example do
      Parsor.get("Hello world oh world...") do
        char 'H'
        char 'e'
        any_of do
          char 'o'
          char 'l'
        end
      end.should == 'Hello'
    end
  end
end
