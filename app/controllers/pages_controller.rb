class PagesController < ApplicationController
  def learn
  end

  def about
  end

  def rcw_faculty
  end

  def sose
  end

  def som
  end

  def soh
  end

  def soss
  end

  def urc
  end

  def asog
  end

  def agsb
  end

  def asmph
  end

  def als
  end

  def som_download_organizational_matrix
    send_file(
      "#{Rails.root}/files/som-organizational-matrix.pptx",
      filename: "som-organizational-matrix.pptx",
      type: "application/vnd.openxmlformats-officedocument.presentationml.presentation"
    )
  end

  def download_compendium
    send_file(
      "#{Rails.root}/files/compendium_2018_2019.pdf",
      filename: "compendium_2018_2019.pdf",
      disposition: "attachment"
    )
  end
end
