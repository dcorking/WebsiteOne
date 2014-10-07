module Statistics 
  extend ActiveSupport::Concern

  def get_stats_for(entity)
    stats = {}.tap do |stats|
      case entity
      when :articles then
        stats[:count] = Article.count
      when :projects then
        stats[:count] = Project.where("lower(status) = ?", "active").length
      when :members then
        stats[:count] = User.count
      when :documents then
        stats[:count] = Document.count
      when :pairing_minutes then
        stats[:minutes] = ((EventInstance.where('lower(category) = ?', 'pairprogramming').map(&:duration).sum)/60).ceil.to_int
      when :scrum_minutes then
        stats[:count] = ((EventInstance.where('lower(category) = ?', 'scrum').map(&:duration).sum)/60).ceil.to_int
      end
    end
  end
end
