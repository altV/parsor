require_relative 'parsor'

describe Parsor do

  describe 'chars' do
    example {
      Parsor.get("Hello world oh world...") do
        char 'o'
      end.should == ''
    }

    example {
      Parsor.get("Hello world oh world...") do
        char 'H'
      end.should == 'H'
    }

    example {
      Parsor.get("Hello world oh world...") do
        char 'H'
        char 'o'
      end.should == ''
    }
  end

  describe 'strings' do
    example {
      Parsor.get("Hello world oh world...") do
        string 'Hello'
      end.should == 'Hello'
    }

    example {
      Parsor.get("Hello world oh world...") do
        string 'Hel o'
      end.should == ''
    }
  end

  describe 'combinators' do
    example {
      Parsor.get("Hello world oh world...") do
        char 'H'
        char 'e'
        many do
          char 'l'
        end
        char 'o'
      end.should == 'Hello'
    }

    example {
      Parsor.get("Hello world oh world...") do
        char 'H'
        char 'e'
        any_of do
          char 'o'
          char 'l'
        end
      end.should == 'Hello'
    }
  end
end
