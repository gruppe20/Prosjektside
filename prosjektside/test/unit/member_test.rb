require 'test_helper'

class MemberTest < ActiveSupport::TestCase
    #test "the truth" do
    #	assert true
    #end

    test "should not save blank member" do
    	member = Member.new
    	assert !member.save, "Saved a blank member"
	end

	test "should not save without picture" do 
		member = Member.new
		member.name = "test"
		member.age = 21
		member.role = "test"
		assert !member.save, "Saved member without picture"
	end

	test "should save without role" do 
		member = Member.new
		member.name = "test"
		member.age = 21
		member.pic = "test"
		assert member.save, "Did not save member without role"
	end

end
