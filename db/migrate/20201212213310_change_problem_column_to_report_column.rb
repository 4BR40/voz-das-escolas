class ChangeProblemColumnToReportColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :problem_id, :report_id
  end
end
