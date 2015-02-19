class FormulasController < InheritedResources::Base

  private

    def formula_params
      params.require(:formula).permit(:name, :description)
    end
end

