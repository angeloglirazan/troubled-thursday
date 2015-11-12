ActiveAdmin.register Question do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  permit_params :text, :author, :answer_attributes => [:text, :admin_user_id]
  
  config.comments = false
  
  filter :text
  filter :author
  filter :created_at
  filter :updated_at
  
  menu :label => proc{
    new_questions = Question.where(:answer_id => nil).count
    "Questions <i>#{new_questions}</i>".html_safe
  }
  
  show do
    attributes_table do
      row :text
      row :author
    end
    if question.answer
      panel "Answer" do
        attributes_table_for question.answer do
          row :text
        end
      end
    end
  end
  
  form do |f|
    unless f.object.answer
      f.object.build_answer
    end
    f.inputs "Question" do
      f.input :text
      f.input :author, :hint => "Shows 'Anonymous' if empty."
    end
    if !f.object.new_record?
      f.inputs "Answer" do
        f.semantic_fields_for :answer do |a|
          a.input :text
          a.input :admin_user_id, :as => :hidden, :input_html => { :value => proc{current_admin_user.id} }
        end
      end
    end
    f.submit
  end
  
  controller do
    def update      
      question = Question.find(params[:id])
      if question.update(permitted_params[:question])
        redirect_to :admin_questions, :notice => "Question updated successfully."
      else
        render :edit
      end
    end
    
  end
  
end
