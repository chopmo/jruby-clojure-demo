class HomeController < ApplicationController
  def index
    @size = params[:size] || "1000"
    clj = JRClj.new
    %w{core stats charts}.each { |l| clj._import("incanter.#{l}") }
    clj.eval clj.read_string "(incanter.core/save (incanter.charts/histogram (incanter.stats/sample-normal #{@size.to_i})) \"#{::Rails.root.to_s}/public/images/out.png\")"
  end
  
end
