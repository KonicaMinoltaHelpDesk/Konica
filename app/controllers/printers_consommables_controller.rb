class PrintersConsommablesController < ApplicationController

	# Ajouter la dépendance d'un conso dans un printer
	def create 
		@printers_consommable = PrintersConsommable.create(add_consommables_printer_params)
		@printer = Printer.find(params[:printers_consommable][:printer_id])
		if @printers_consommable.save
			flash[:notice] = "Le consommable a bien été ajouté dans l'Imprimante \'#{@printer.code_printers}\'."
			redirect_to printer_path(params[:printers_consommable][:printer_id]) + "#ajouterConsommable"
		else
			flash[:alert] = "Le consommable n'a pas été ajouté."
		end
	end


private
	def add_consommables_printer_params
		params.require(:printers_consommable).permit(:consommable_id, :printer_id)
	end
end