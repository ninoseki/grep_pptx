describe GrepPptx::Grepper do
  describe "#initialize" do
    context "given a non-existence path" do
      it "should raise an error" do
        path = File.expand_path("../there_is_no_such_directory", __FILE__)
        expect {
          GrepPptx::Grepper.new(path, "hoge")
        }.to raise_error(GrepPptx::InvalidPathError)
      end
    end
  end

  describe "#grep" do
    context "Expected zero match" do
      it "should return grep results as Array" do
        path = File.expand_path("../fixtures/", __FILE__)
        puts path
        grepper = GrepPptx::Grepper.new(path, "hoge")
        results = grepper.grep
        expect(results).to be_a(Array)
        expect(results.length).to eq(2)
        results.each do |result|
          expect(result.empty?).to be_truthy
        end
      end
    end

    context "Expected positive matches" do
      it "should return grep results as Array" do
        path = File.expand_path("../fixtures/", __FILE__)
        puts path
        grepper = GrepPptx::Grepper.new(path, "Lorem")
        results = grepper.grep
        expect(results).to be_a(Array)
        expect(results.length).to eq(2)
      end
    end

    context "Expected positive matches and giving a file path" do
      it "should return grep results as Array" do
        path = File.expand_path("../fixtures/コピー.pptx", __FILE__)
        puts path
        grepper = GrepPptx::Grepper.new(path, "Lorem")
        results = grepper.grep
        expect(results).to be_a(Array)
        expect(results.length).to eq(1)
      end
    end
  end
end
