class ColorDetailController < UIViewController
  def viewDidLoad
    super
    self.view.backgroundColor = @color

    rightButton =
        UIBarButtonItem.alloc.initWithTitle("Change",
                                            style: UIBarButtonItemStyleBordered,
                                            target: self,
                                            action: 'change_color')
    self.navigationItem.rightBarButtonItem = rightButton
  end

  def initWithColor(color)
    self.initWithNibName(nil, bundle: nil)
    @color = color
    self.title = "Detail"
    self
  end

  def change_color
    controller = ChangeColorController.alloc.initWithNibName(nil, bundle: nil)
    controller.color_detail_controller = self
    self.presentViewController(
        UINavigationController.alloc.initWithRootViewController(controller),
        animated: true,
        completion: lambda{}
    )
  end

end