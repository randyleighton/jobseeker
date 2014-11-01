describe Contact do

	it { should belong_to :company}
	it { should have_many :job_applications}

end